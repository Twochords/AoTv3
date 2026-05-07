our $SC_DBH;

sub sc_require_db {
    if (!$SC_DBH) {
        eval { $SC_DBH = plugin::LoadMysql(); };
    }
    if (!$SC_DBH) {
        warn("[SpellChoice-Debug][GlobalPlayer] DB unavailable\n");
        return undef;
    }
    return $SC_DBH;
}

# items: 67704
sub EVENT_ENTERZONE { #message only appears in Cities / Pok and wherever the Wayfarer Camps (LDON) is in.  This message won't appear in the player's home city.
  if($ulevel >= 15 && !defined($qglobals{Wayfarer}) && quest::is_lost_dungeons_of_norrath_enabled()) {
    if($client->GetStartZone()!=$zoneid && ($zoneid == 1 || $zoneid == 2 || $zoneid == 3 || $zoneid == 8 || $zoneid == 9 || $zoneid == 10 || $zoneid == 19 || $zoneid == 22 || $zoneid == 23 || $zoneid == 24 || $zoneid == 29 || $zoneid == 30 || $zoneid == 34 || $zoneid == 35 || $zoneid == 40 || $zoneid == 41 || $zoneid == 42 || $zoneid == 45 || $zoneid == 49 || $zoneid == 52 || $zoneid == 54 || $zoneid == 55 || $zoneid == 60 || $zoneid == 61 || $zoneid == 62 || $zoneid == 67 || $zoneid == 68 || $zoneid == 75 || $zoneid == 82 || $zoneid == 106 || $zoneid == 155 || $zoneid == 202 || $zoneid == 382 || $zoneid == 383 || $zoneid == 392 || $zoneid == 393 || $zoneid == 408)) {
	  $client->Message(15,"A mysterious voice whispers to you, 'If you can feel me in your thoughts, know this -- something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, and find out more. Adventure awaits you, my friend.'");
	}
  }

    # Re-open pending ImGui spell choice menu events on zone-in.
    sc_process_lua_bridge_trigger('EVENT_ENTERZONE');
    sc_backfill_if_needed('EVENT_ENTERZONE');
    sc_enqueue_unclaimed_choice_event();
}

sub EVENT_COMBINE_VALIDATE {
	# $validate_type values = { "check_zone", "check_tradeskill" }
	# criteria exports:
	#	"check_zone"		=> zone_id
	#	"check_tradeskill"	=> tradeskill_id (not active)
	if ($recipe_id == 10344) {
		if ($validate_type =~/check_zone/i) {
			if ($zone_id != 289 && $zone_id != 290) {
				return 1;
			}
		}
	}

	return 0;
}

sub EVENT_COMBINE_SUCCESS {
    if ($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
            "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
            "You were successful in assembling most of the stone but there are four slots left to fill, ".
            "where could those four pieces be?"
        );
    }
    elsif ($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
            melee  => {
                10903 => 67665,
                10346 => 67660,
                10334 => 67653
            },
            hybrid => {
                10903 => 67666,
                10346 => 67661,
                10334 => 67654
            },
            priest => {
                10903 => 67667,
                10346 => 67662,
                10334 => 67655
            },
            caster => {
                10903 => 67668,
                10346 => 67663,
                10334 => 67656
            }
        );
        my $type = plugin::ClassType($class);
        quest::summonitem($reward{$type}{$recipe_id});
        quest::summonitem(67704); # Item: Vaifan's Clockwork Gemcutter Tools
        $client->Message(1,"Success");
    }
}

sub EVENT_CONNECT {
    # the main key is the ID of the AA
    # the first set is the age required in seconds
    # the second is if to ignore the age and grant anyways live test server style
    # the third is enabled
    my %vet_aa = (
        481 => [31536000, 1, 1], ## Lesson of the Devote 1 yr
        482 => [63072000, 1, 1], ## Infusion of the Faithful 2 yr
        483 => [94608000, 1, 1], ## Chaotic Jester 3 yr
        484 => [126144000, 1, 1], ## Expedient Recovery 4 yr
        485 => [157680000, 1, 1], ## Steadfast Servant 5 yr
        486 => [189216000, 1, 1], ## Staunch Recovery 6 yr
        487 => [220752000, 1, 1], ## Intensity of the Resolute 7 yr
        511 => [252288000, 1, 1], ## Throne of Heroes 8 yr
        2000 => [283824000, 1, 1], ## Armor of Experience 9 yr
        8081 => [315360000, 1, 1], ## Summon Resupply Agent 10 yr
        8130 => [346896000, 1, 1], ## Summon Clockwork Banker 11 yr
        453 => [378432000, 1, 1], ## Summon Permutation Peddler 12 yr
        182 => [409968000, 1, 1], ## Summon Personal Tribute Master 13 yr
        600 => [441504000, 1, 1] ## Blessing of the Devoted 14 yr
    );
    my $age = $client->GetAccountAge();
    for (my ($aa, $v) = each %vet_aa) {
        if ($v[2] && ($v[1] || $age >= $v[0])) {
            $client->GrantAlternateAdvancementAbility($aa, 1);
        }
    }

    quest::settimer("spell_choice_inbound_poll", 2);
    sc_process_lua_bridge_trigger('EVENT_CONNECT');
    sc_backfill_if_needed('EVENT_CONNECT');
    sc_enqueue_unclaimed_choice_event();
}

sub EVENT_LEVEL_UP {
    my $char_id = $client->GetCharacterID();
    my $char_name = $client->GetName();
    my $level = $client->GetLevel();
    my $old_level = $level > 1 ? ($level - 1) : 1;
    my $last_seen = sc_get_last_generated_level($char_id);
    if ($last_seen > 0 && $last_seen < $level) {
        $old_level = $last_seen;
    }

    my $lvl_msg = "[SpellChoice] EVENT_LEVEL_UP fired: char_id=$char_id name=$char_name old_level=$old_level new_level=$level";
    $client->Message(15, $lvl_msg);
    sc_debug_log($lvl_msg);

    my $secret = sc_require_secret_or_fail('EVENT_LEVEL_UP');
    if (!$secret) {
        return;
    }

    sc_generate_store_and_queue($char_id, $level, 'EVENT_LEVEL_UP');
}

sub EVENT_TIMER {
    if ($timer eq "spell_choice_inbound_poll") {
        sc_process_lua_bridge_trigger('EVENT_TIMER');
        sc_process_inbound_actions_for_client();
    }
}

sub EVENT_DISCONNECT {
    quest::stoptimer("spell_choice_inbound_poll");
}

# ---------------------------------------------------------------------------
# EVENT_POPUPRESPONSE
# Handles the popup-response packet sent by SpellChoiceMenu::SendChoice().
# The dinput DLL transmits a standard EQ popup-response opcode with
#   popup_id = SC_POPUP_BASE + choice_index  (50100 / 50101 / 50102)
# Server validates the pending row, awards the spell, and marks it claimed.
# ---------------------------------------------------------------------------
sub EVENT_POPUPRESPONSE {
    # Only handle spell-choice popup IDs.
    return unless ($popupid >= 50100 && $popupid <= 50102);

    my $choice_index = $popupid - 50100;  # 0, 1, or 2  (maps to spell_id_1/2/3)

    my $char_id = $client->GetCharacterID();

    my $db = sc_require_db() or return;

    # Fetch the single unclaimed pending row for this character.
    my $pending = $db->selectrow_hashref(
        "SELECT * FROM spell_choices_pending WHERE character_id = ? AND claimed = 0 AND (expires_at IS NULL OR expires_at > NOW()) ORDER BY character_level DESC LIMIT 1",
        undef,
        $char_id
    );

    unless ($pending && $pending->{id}) {
        sc_debug_log("[SpellChoice] EVENT_POPUPRESPONSE: no unclaimed pending for char_id=$char_id popupid=$popupid");
        $client->Message(13, "No pending spell choice found.");
        return;
    }

    # Map choice_index (0-2) to the corresponding spell_id column.
    my @spell_ids = ($pending->{spell_id_1}, $pending->{spell_id_2}, $pending->{spell_id_3});
    my $spell_id  = $spell_ids[$choice_index];

    unless ($spell_id && int($spell_id) > 0) {
        sc_debug_log("[SpellChoice] EVENT_POPUPRESPONSE: invalid spell_id for choice_index=$choice_index pending_id=$pending->{id}");
        $client->Message(13, "Invalid spell choice.");
        return;
    }

    # Look up the spell name for the confirmation message.
    my $spell_row = $db->selectrow_hashref(
        "SELECT name FROM spells_new WHERE id = ? LIMIT 1",
        undef,
        int($spell_id)
    );
    my $spell_name = ($spell_row && $spell_row->{name}) ? $spell_row->{name} : "Unknown Spell";

    # Mark the pending row as claimed.
    my $rows_updated = $db->do(
        "UPDATE spell_choices_pending SET claimed = 1, claimed_spell_id = ?, claimed_at = NOW() WHERE id = ? AND character_id = ? AND claimed = 0",
        undef,
        int($spell_id),
        $pending->{id},
        $char_id
    );

    unless ($rows_updated && $rows_updated > 0) {
        # Another process claimed it first – race condition guard.
        sc_debug_log("[SpellChoice] EVENT_POPUPRESPONSE: claim raced or already applied pending_id=$pending->{id} char_id=$char_id");
        $client->Message(13, "Your spell choice has already been recorded.");
        return;
    }

    # Record in history.
    eval {
        $db->do(
            "INSERT INTO spell_choices_history (character_id, character_level, pending_id, spell_id, chosen_at, source) VALUES (?, ?, ?, ?, NOW(), 'dinput')",
            undef,
            $char_id,
            int($pending->{character_level}),
            int($pending->{id}),
            int($spell_id)
        );
    };

    # Award the spell via the server-side scribe API.
    # quest::scribe_spells takes a spell_id; the slot is selected automatically.
    eval {
        $client->ScribeSpell(int($spell_id), -1);
    };
    if ($@) {
        # Fallback: use quest:: binding if ScribeSpell not available on this version.
        eval { quest::scribe_spells(int($spell_id)); };
    }

    $client->Message(15, "You have selected: $spell_name. The spell has been scribed to your spellbook.");
    sc_debug_log("[SpellChoice] EVENT_POPUPRESPONSE: awarded spell_id=$spell_id name=$spell_name to char_id=$char_id pending_id=$pending->{id} choice_index=$choice_index");
}

sub sc_process_lua_bridge_trigger {
    my ($source) = @_;
    if (!defined($qglobals{spell_choice_bridge_pending}) || $qglobals{spell_choice_bridge_pending} ne '1') {
        return;
    }

    my $char_id = $client->GetCharacterID();
    my $level = $client->GetLevel();
    my $context = 'LUA_BRIDGE';

    if (defined($qglobals{spell_choice_bridge_context}) && $qglobals{spell_choice_bridge_context} ne '') {
        my @parts = split(/\|/, $qglobals{spell_choice_bridge_context});
        if (scalar(@parts) >= 1 && $parts[0]) {
            $context = $parts[0];
        }
        if (scalar(@parts) >= 2 && $parts[1] =~ /^\d+$/) {
            $level = int($parts[1]);
        }
    }

    my $msg = "[SpellChoice] Lua bridge trigger consumed source=$source context=$context char_id=$char_id level=$level";
    sc_debug_log($msg);
    $client->Message(15, $msg);

    quest::delglobal("spell_choice_bridge_pending");
    quest::delglobal("spell_choice_bridge_context");

    sc_generate_store_and_queue($char_id, $level, $context . '_LUA_BRIDGE');
    sc_enqueue_unclaimed_choice_event();
}

sub sc_backfill_if_needed {
    my ($context) = @_;
    my $db = sc_require_db() or return;
    my $char_id = $client->GetCharacterID();
    my $char_name = $client->GetName();
    my $level = $client->GetLevel();

    if ($level <= 1) {
        return;
    }

    my $level_row = $db->selectrow_hashref(
        "SELECT p.id FROM spell_choices_pending p WHERE p.character_id = ? AND p.character_level = ? LIMIT 1",
        undef,
        $char_id,
        $level
    );
    my $history_row = $db->selectrow_hashref(
        "SELECT h.id FROM spell_choices_history h WHERE h.character_id = ? AND h.character_level = ? LIMIT 1",
        undef,
        $char_id,
        $level
    );

    if (($level_row && $level_row->{id}) || ($history_row && $history_row->{id})) {
        return;
    }

    my $msg = "[SpellChoice] Backfill triggered from $context for char_id=$char_id name=$char_name level=$level";
    sc_debug_log($msg);
    $client->Message(15, $msg);
    sc_generate_store_and_queue($char_id, $level, $context . '_BACKFILL');
}

sub sc_generate_store_and_queue {
    my ($char_id, $level, $context) = @_;
    my $db = sc_require_db() or return 0;
    my $secret = sc_require_secret_or_fail($context);
    if (!$secret) {
        return 0;
    }

    my @choices = sc_generate_spell_choices($char_id, $level);
    if (scalar(@choices) < 3) {
        my $candidate_pref = sc_count_candidate_pool($char_id, ($level - 4) < 1 ? 1 : ($level - 4), $level);
        my $candidate_fallback = sc_count_candidate_pool($char_id, 1, $level);
        my $fail = "[SpellChoice] generation failed context=$context char_id=$char_id level=$level pref_candidates=$candidate_pref fallback_candidates=$candidate_fallback";
        sc_debug_log($fail);
        $client->Message(13, "[SpellChoice] Generation failed. pref=$candidate_pref fallback=$candidate_fallback");
        return 0;
    }

    my $token = sc_make_token($char_id, $level, $choices[0]{id}, $choices[1]{id}, $choices[2]{id}, $secret);
    my $menu_nonce = sc_make_nonce($char_id, $level, $choices[0]{id}, $choices[1]{id}, $choices[2]{id}, $secret);

    my $insert = $db->prepare(qq{
        INSERT INTO spell_choices_pending
            (character_id, character_level, spell_id_1, spell_id_2, spell_id_3, choice_token, menu_nonce, expires_at, token_expires_at, claimed)
        VALUES
            (?, ?, ?, ?, ?, ?, ?, NOW() + INTERVAL 30 DAY, NOW() + INTERVAL 30 MINUTE, 0)
        ON DUPLICATE KEY UPDATE
            spell_id_1 = VALUES(spell_id_1),
            spell_id_2 = VALUES(spell_id_2),
            spell_id_3 = VALUES(spell_id_3),
            choice_token = VALUES(choice_token),
            menu_nonce = VALUES(menu_nonce),
            claimed = 0,
            claimed_spell_id = NULL,
            claimed_at = NULL,
            expires_at = VALUES(expires_at),
            token_expires_at = VALUES(token_expires_at)
    });
    $insert->execute(
        $char_id,
        $level,
        $choices[0]{id},
        $choices[1]{id},
        $choices[2]{id},
        $token,
        $menu_nonce
    );

    my $pending = sc_get_unclaimed_pending_row($char_id);
    if ($pending && $pending->{id}) {
        sc_debug_log("[SpellChoice] pending row created context=$context char_id=$char_id pending_id=$pending->{id} level=$level spells=$pending->{spell_id_1},$pending->{spell_id_2},$pending->{spell_id_3}");
        sc_enqueue_menu_event($char_id, $pending->{id});
        $client->Message(15, "Spell choice available. Open your progression window.");
        return 1;
    }

    sc_debug_log("[SpellChoice] pending row missing after insert context=$context char_id=$char_id level=$level");
    return 0;
}

sub sc_count_candidate_pool {
    my ($char_id, $min_level, $max_level) = @_;
    my $db = sc_require_db() or return 0;
    my $min_expr = sc_min_usable_level_expr();
    my $sql = qq{
        SELECT COUNT(*) AS c FROM (
            SELECT s.id, $min_expr AS min_usable_level
            FROM spells_new s
            LEFT JOIN spell_choices_weights w ON w.spell_id = s.id
            LEFT JOIN spell_choices_blacklist b ON b.spell_id = s.id AND b.active = 1
            LEFT JOIN spell_choices_history h ON h.character_id = ? AND h.spell_id = s.id
            LEFT JOIN character_spells cs ON cs.id = ? AND cs.spell_id = s.id
            LEFT JOIN spell_choices_families f ON f.spell_id = s.id
            LEFT JOIN spell_choices_families f2 ON f2.family_key = f.family_key AND f2.family_rank > f.family_rank
            LEFT JOIN spell_choices_history h2 ON h2.character_id = ? AND h2.spell_id = f2.spell_id
            WHERE
                b.spell_id IS NULL
                AND h.id IS NULL
                AND cs.spell_id IS NULL
                AND h2.id IS NULL
                AND s.IsDiscipline = 0
                AND s.skill <> 52
                AND (s.pcnpc_only_flag IS NULL OR s.pcnpc_only_flag <> 2)
                AND s.npc_category = 0
                AND s.targettype NOT IN (14, 41, 58)
                AND s.name NOT LIKE '%test%'
                AND s.name NOT LIKE '%Test%'
                AND s.name NOT LIKE 'GM %'
                AND s.id BETWEEN 1 AND 60000
                AND NOT (
                    s.classes1=255 AND s.classes2=255 AND s.classes3=255 AND s.classes4=255
                    AND s.classes5=255 AND s.classes6=255 AND s.classes7=255 AND s.classes8=255
                    AND s.classes9=255 AND s.classes10=255 AND s.classes11=255 AND s.classes12=255
                    AND s.classes13=255 AND s.classes14=255 AND s.classes15=255 AND s.classes16=255
                )
                AND NOT (
                    s.effectid1=254 AND s.effectid2=254 AND s.effectid3=254
                    AND s.effectid4=254 AND s.effectid5=254 AND s.effectid6=254
                )
            HAVING min_usable_level BETWEEN ? AND ?
        ) x
    };

    my $row = $db->selectrow_hashref($sql, undef, $char_id, $char_id, $char_id, $min_level, $max_level);
    return $row && $row->{c} ? int($row->{c}) : 0;
}

sub sc_get_last_generated_level {
    my ($char_id) = @_;
    my $db = sc_require_db() or return 0;
    my $row = $db->selectrow_hashref(
        "SELECT GREATEST(COALESCE((SELECT MAX(character_level) FROM spell_choices_pending WHERE character_id = ?),0), COALESCE((SELECT MAX(character_level) FROM spell_choices_history WHERE character_id = ?),0)) AS lvl",
        undef,
        $char_id,
        $char_id
    );
    return $row && $row->{lvl} ? int($row->{lvl}) : 0;
}

sub sc_generate_spell_choices {
    my ($char_id, $level) = @_;
    my $min_pref = $level - 4;
    if ($min_pref < 1) {
        $min_pref = 1;
    }

    my @pool = sc_fetch_spell_pool($char_id, $min_pref, $level, 250);
    sc_debug_log("[SpellChoice] candidate pool pref char_id=$char_id level=$level min=$min_pref max=$level count=" . scalar(@pool));
    if (scalar(@pool) < 3) {
        @pool = sc_fetch_spell_pool($char_id, 1, $level, 350);
        sc_debug_log("[SpellChoice] candidate pool fallback char_id=$char_id level=$level min=1 max=$level count=" . scalar(@pool));
    }

    return sc_weighted_pick_three(@pool);
}

sub sc_fetch_spell_pool {
    my ($char_id, $min_level, $max_level, $limit) = @_;
    my $db = sc_require_db() or return ();
    my $min_expr = sc_min_usable_level_expr();

    my $sql = qq{
        SELECT
            s.id,
            s.name,
            s.descnum,
            s.spellgroup,
            s.rank,
            COALESCE(w.weight, 100) AS weight,
            $min_expr AS min_usable_level
        FROM spells_new s
        LEFT JOIN spell_choices_weights w
            ON w.spell_id = s.id
        LEFT JOIN spell_choices_blacklist b
            ON b.spell_id = s.id AND b.active = 1
        LEFT JOIN spell_choices_history h
            ON h.character_id = ? AND h.spell_id = s.id
        LEFT JOIN character_spells cs
            ON cs.id = ? AND cs.spell_id = s.id
        LEFT JOIN spell_choices_families f
            ON f.spell_id = s.id
        LEFT JOIN spell_choices_families f2
            ON f2.family_key = f.family_key AND f2.family_rank > f.family_rank
        LEFT JOIN spell_choices_history h2
            ON h2.character_id = ? AND h2.spell_id = f2.spell_id
        WHERE
            b.spell_id IS NULL
            AND h.id IS NULL
            AND cs.spell_id IS NULL
            AND h2.id IS NULL
            AND s.IsDiscipline = 0
            AND s.skill <> 52
            AND (s.pcnpc_only_flag IS NULL OR s.pcnpc_only_flag <> 2)
            AND s.npc_category = 0
            AND s.targettype NOT IN (14, 41, 58)
            AND s.name NOT LIKE '%test%'
            AND s.name NOT LIKE '%Test%'
            AND s.name NOT LIKE 'GM %'
            AND s.id BETWEEN 1 AND 60000
            AND NOT (
                s.classes1=255 AND s.classes2=255 AND s.classes3=255 AND s.classes4=255
                AND s.classes5=255 AND s.classes6=255 AND s.classes7=255 AND s.classes8=255
                AND s.classes9=255 AND s.classes10=255 AND s.classes11=255 AND s.classes12=255
                AND s.classes13=255 AND s.classes14=255 AND s.classes15=255 AND s.classes16=255
            )
            AND NOT (
                s.effectid1=254 AND s.effectid2=254 AND s.effectid3=254
                AND s.effectid4=254 AND s.effectid5=254 AND s.effectid6=254
            )
        HAVING min_usable_level BETWEEN ? AND ?
        ORDER BY RAND()
        LIMIT ?
    };

    my $sth = $db->prepare($sql);
    $sth->execute($char_id, $char_id, $char_id, $min_level, $max_level, $limit);

    my @rows;
    while (my $row = $sth->fetchrow_hashref()) {
        push @rows, $row;
    }

    return @rows;
}

sub sc_weighted_pick_three {
    my @pool = @_;
    my @picked;
    my %picked_ids;

    while (scalar(@picked) < 3 && scalar(@pool) > 0) {
        my $total_weight = 0;
        foreach my $r (@pool) {
            my $weight = $r->{weight};
            if (!$weight || $weight < 1) {
                $weight = 1;
            }
            $total_weight += $weight;
        }

        my $roll = rand($total_weight);
        my $acc = 0;
        my $selected_index = -1;

        for (my $i = 0; $i < scalar(@pool); $i++) {
            my $weight = $pool[$i]{weight};
            if (!$weight || $weight < 1) {
                $weight = 1;
            }
            $acc += $weight;
            if ($roll <= $acc) {
                $selected_index = $i;
                last;
            }
        }

        if ($selected_index < 0) {
            last;
        }

        my $candidate = $pool[$selected_index];
        splice(@pool, $selected_index, 1);
        if ($picked_ids{$candidate->{id}}) {
            next;
        }

        $picked_ids{$candidate->{id}} = 1;
        push @picked, $candidate;
    }

    return @picked;
}

sub sc_min_usable_level_expr {
    return q{
        LEAST(
            IF(s.classes1<255,s.classes1,255), IF(s.classes2<255,s.classes2,255),
            IF(s.classes3<255,s.classes3,255), IF(s.classes4<255,s.classes4,255),
            IF(s.classes5<255,s.classes5,255), IF(s.classes6<255,s.classes6,255),
            IF(s.classes7<255,s.classes7,255), IF(s.classes8<255,s.classes8,255),
            IF(s.classes9<255,s.classes9,255), IF(s.classes10<255,s.classes10,255),
            IF(s.classes11<255,s.classes11,255), IF(s.classes12<255,s.classes12,255),
            IF(s.classes13<255,s.classes13,255), IF(s.classes14<255,s.classes14,255),
            IF(s.classes15<255,s.classes15,255), IF(s.classes16<255,s.classes16,255)
        )
    };
}

sub sc_make_token {
    my ($char_id, $level, $spell_1, $spell_2, $spell_3, $secret) = @_;
    my $raw = join(':',
        $char_id,
        $level,
        $spell_1,
        $spell_2,
        $spell_3,
        time(),
        int(rand(1000000000)),
        $secret
    );

    my $token = '';
    eval {
        require Digest::SHA;
        $token = Digest::SHA::sha256_hex($raw);
    };

    if (!$token) {
        $token = unpack('H*', $raw);
        if (length($token) > 64) {
            $token = substr($token, 0, 64);
        }
    }

    return $token;
}

sub sc_make_nonce {
    my ($char_id, $level, $spell_1, $spell_2, $spell_3, $secret) = @_;
    my $raw = join(':',
        'nonce',
        $char_id,
        $level,
        $spell_1,
        $spell_2,
        $spell_3,
        time(),
        int(rand(1000000000)),
        $secret
    );

    my $nonce = '';
    eval {
        require Digest::SHA;
        $nonce = Digest::SHA::sha256_hex($raw);
    };

    if (!$nonce) {
        $nonce = unpack('H*', $raw);
        if (length($nonce) > 64) {
            $nonce = substr($nonce, 0, 64);
        }
    }

    return $nonce;
}

sub sc_require_secret_or_fail {
    my ($context) = @_;
    my $secret = $ENV{SPELL_CHOICE_SECRET};
    if (!$secret || length($secret) < 24) {
        my $msg = 'Spell choice system misconfigured: SPELL_CHOICE_SECRET missing or too short.';
        warn('[spell_choice][' . $context . '] ' . $msg . "\n");
        $client->Message(13, $msg);
        return '';
    }

    return $secret;
}

sub sc_enqueue_unclaimed_choice_event {
    my $db = sc_require_db() or return;
    my $secret = sc_require_secret_or_fail('sc_enqueue_unclaimed_choice_event');
    if (!$secret) {
        return;
    }

    my $char_id = $client->GetCharacterID();
    my $pending = sc_get_unclaimed_pending_row($char_id);
    if (!$pending || !$pending->{id}) {
        return;
    }

    if (!$pending->{token_expires_at} || !$pending->{menu_nonce} || sc_pending_token_expired($pending->{id})) {
        sc_refresh_pending_auth($pending, $secret);
        $pending = sc_get_unclaimed_pending_row($char_id);
        if (!$pending || !$pending->{id}) {
            return;
        }
    }

    my $stale = $db->do(
        "DELETE FROM spell_choice_menu_events WHERE character_id = ? AND pending_id = ? AND delivered = 0 AND menu_nonce <> ?",
        undef,
        $char_id,
        $pending->{id},
        $pending->{menu_nonce}
    );

    my $exists = $db->selectrow_hashref(
        "SELECT id FROM spell_choice_menu_events WHERE character_id = ? AND pending_id = ? AND menu_nonce = ? AND delivered = 0 LIMIT 1",
        undef,
        $char_id,
        $pending->{id},
        $pending->{menu_nonce}
    );
    sc_enqueue_menu_event($char_id, $pending->{id});
}

sub sc_pending_token_expired {
    my ($pending_id) = @_;
    my $db = sc_require_db() or return 0;
    my $expired = $db->selectrow_hashref(
        "SELECT id FROM spell_choices_pending WHERE id = ? AND (token_expires_at IS NULL OR token_expires_at <= NOW()) LIMIT 1",
        undef,
        $pending_id
    );
    if ($expired && $expired->{id}) {
        return 1;
    }
    return 0;
}

sub sc_refresh_pending_auth {
    my ($pending, $secret) = @_;
    my $db = sc_require_db() or return;
    if (!$pending || !$pending->{id}) {
        return;
    }

    my $token = sc_make_token(
        $pending->{character_id},
        $pending->{character_level},
        $pending->{spell_id_1},
        $pending->{spell_id_2},
        $pending->{spell_id_3},
        $secret
    );

    my $menu_nonce = sc_make_nonce(
        $pending->{character_id},
        $pending->{character_level},
        $pending->{spell_id_1},
        $pending->{spell_id_2},
        $pending->{spell_id_3},
        $secret
    );

    $db->do(
        "UPDATE spell_choices_pending SET choice_token = ?, menu_nonce = ?, token_expires_at = NOW() + INTERVAL 30 MINUTE WHERE id = ? AND character_id = ? AND claimed = 0",
        undef,
        $token,
        $menu_nonce,
        $pending->{id},
        $pending->{character_id}
    );
}

sub sc_enqueue_menu_event {
    my ($char_id, $pending_id) = @_;
    my $db = sc_require_db() or return;
    my $pending = $db->selectrow_hashref(
        "SELECT * FROM spell_choices_pending WHERE id = ? AND character_id = ? LIMIT 1",
        undef,
        $pending_id,
        $char_id
    );
    if (!$pending) {
        return;
    }

    my $min_expr = sc_min_usable_level_expr();
    my @spells;
    my @spell_ids = ($pending->{spell_id_1}, $pending->{spell_id_2}, $pending->{spell_id_3});
    for (my $idx = 0; $idx < scalar(@spell_ids); $idx++) {
        my $spell_id = $spell_ids[$idx];
        my $spell = $db->selectrow_hashref(qq{
            SELECT
                id,
                name,
                descnum,
                $min_expr AS min_level,
                classes1, classes2, classes3, classes4,
                classes5, classes6, classes7, classes8,
                classes9, classes10, classes11, classes12,
                classes13, classes14, classes15, classes16
            FROM spells_new s
            WHERE id = ?
            LIMIT 1
        }, undef, $spell_id);
        if (!$spell) {
            next;
        }

        my $source_class = sc_primary_class_label($spell);
        push @spells, {
            slot => ($idx + 1),
            id => int($spell->{id}),
            name => $spell->{name},
            min_level => int($spell->{min_level}),
            source_class => $source_class,
            descnum => int($spell->{descnum})
        };
    }

    if (scalar(@spells) != 3) {
        return;
    }

    my $payload = '{'
        . '"event":"spell_choice.open",'
        . '"character_id":' . int($char_id) . ','
        . '"pending_id":' . int($pending->{id}) . ','
        . '"level":' . int($pending->{character_level}) . ','
        . '"token":"' . sc_json_escape($pending->{choice_token}) . '",'
        . '"menu_nonce":"' . sc_json_escape($pending->{menu_nonce}) . '",'
        . '"expires_at":"' . sc_json_escape($pending->{expires_at}) . '",'
        . '"token_expires_at":"' . sc_json_escape($pending->{token_expires_at}) . '",'
        . '"spells":['
        . '{"slot":1,"id":' . int($spells[0]{id}) . ',"name":"' . sc_json_escape($spells[0]{name}) . '","min_level":' . int($spells[0]{min_level}) . ',"source_class":"' . sc_json_escape($spells[0]{source_class}) . '","descnum":' . int($spells[0]{descnum}) . '},'
        . '{"slot":2,"id":' . int($spells[1]{id}) . ',"name":"' . sc_json_escape($spells[1]{name}) . '","min_level":' . int($spells[1]{min_level}) . ',"source_class":"' . sc_json_escape($spells[1]{source_class}) . '","descnum":' . int($spells[1]{descnum}) . '},'
        . '{"slot":3,"id":' . int($spells[2]{id}) . ',"name":"' . sc_json_escape($spells[2]{name}) . '","min_level":' . int($spells[2]{min_level}) . ',"source_class":"' . sc_json_escape($spells[2]{source_class}) . '","descnum":' . int($spells[2]{descnum}) . '}'
        . ']'
        . '}';

    my $insert = $db->prepare(
        "INSERT INTO spell_choice_menu_events (character_id, pending_id, event_type, menu_nonce, payload_json, delivered) VALUES (?, ?, 'open_menu', ?, ?, 0)"
    );
    my $event_id = $db->selectrow_hashref(
        "SELECT id FROM spell_choice_menu_events WHERE character_id = ? AND pending_id = ? AND menu_nonce = ? AND delivered = 0 ORDER BY id DESC LIMIT 1",
        undef,
        $char_id,
        $pending_id,
        $pending->{menu_nonce}
    );
    if (!$event_id || !$event_id->{id}) {
        $insert->execute($char_id, $pending_id, $pending->{menu_nonce}, $payload);
        $event_id = $db->selectrow_hashref(
            "SELECT id FROM spell_choice_menu_events WHERE character_id = ? AND pending_id = ? AND menu_nonce = ? AND delivered = 0 ORDER BY id DESC LIMIT 1",
            undef,
            $char_id,
            $pending_id,
            $pending->{menu_nonce}
        );
    }
    if ($event_id && $event_id->{id}) {
        sc_debug_log("[SpellChoice] open_menu event queued char_id=$char_id pending_id=$pending_id event_id=$event_id->{id} delivered=0");
    }

    my $target_client = $entity_list->GetClientByCharID($char_id);
    if (!$target_client) {
        sc_debug_log("[SpellChoice-Debug][GlobalPlayer] SendPayload skipped; client not found char_id=$char_id pending_id=$pending_id");
        return;
    }

    my $sc_open_payload = join('|',
        'SC_OPEN',
        int($pending->{character_level}),
        $pending->{menu_nonce},
        int($spells[0]{id}), sc_chat_escape($spells[0]{name}),
        int($spells[1]{id}), sc_chat_escape($spells[1]{name}),
        int($spells[2]{id}), sc_chat_escape($spells[2]{name})
    );

    eval {
        $target_client->Message(15, $sc_open_payload);
    };
    if ($@) {
        sc_debug_log("[SpellChoice-Debug][GlobalPlayer] SC_OPEN chat emit failed char_id=$char_id pending_id=$pending_id error=$@");
        return;
    }

    sc_debug_log("[SpellChoice-Debug][GlobalPlayer] SC_OPEN chat emitted char_id=$char_id pending_id=$pending_id nonce=$pending->{menu_nonce}");
}

sub sc_get_unclaimed_pending_row {
    my ($char_id) = @_;
    my $db = sc_require_db() or return undef;
    return $db->selectrow_hashref(
        "SELECT * FROM spell_choices_pending WHERE character_id = ? AND claimed = 0 AND (expires_at IS NULL OR expires_at > NOW()) ORDER BY character_level DESC LIMIT 1",
        undef,
        $char_id
    );
}

sub sc_process_inbound_actions_for_client {
    my $char_id = $client->GetCharacterID();
    my $db = sc_require_db() or return;
    my $sth = $db->prepare(
        "SELECT * FROM spell_choice_inbound_actions WHERE character_id = ? AND status = 'queued' ORDER BY id ASC LIMIT 5"
    );
    $sth->execute($char_id);
    sc_debug_log("[SpellChoice] inbound poll char_id=$char_id");

    while (my $action = $sth->fetchrow_hashref()) {
        my ($ok, $error, $spell_name) = sc_validate_and_award($action);
        if ($ok) {
            $db->do(
                "UPDATE spell_choice_inbound_actions SET status = 'applied', error_text = NULL, processed_at = NOW() WHERE id = ?",
                undef,
                $action->{id}
            );
            if ($spell_name) {
                $client->Message(15, "You have learned $spell_name.");
            }
            sc_debug_log("[SpellChoice] inbound action applied action_id=$action->{id} char_id=$char_id pending_id=$action->{pending_id}");
        } else {
            $db->do(
                "UPDATE spell_choice_inbound_actions SET status = 'rejected', error_text = ?, processed_at = NOW() WHERE id = ?",
                undef,
                $error,
                $action->{id}
            );
            sc_debug_log("[SpellChoice] inbound action rejected action_id=$action->{id} char_id=$char_id pending_id=$action->{pending_id} error=$error");
        }
    }
}

sub sc_validate_and_award {
    my ($action) = @_;
    my $db = sc_require_db() or return (0, 'db_unavailable', '');

    my $char_id = $client->GetCharacterID();
    if (int($action->{character_id}) != int($char_id)) {
        return (0, 'character_id_mismatch', '');
    }

    my $choice_index = int($action->{choice_index});
    if ($choice_index < 1 || $choice_index > 3) {
        return (0, 'invalid_choice_index', '');
    }
    if (!$action->{client_nonce} || length($action->{client_nonce}) < 4) {
        return (0, 'invalid_client_nonce', '');
    }
    if (!$action->{menu_nonce} || length($action->{menu_nonce}) < 16) {
        return (0, 'invalid_menu_nonce', '');
    }

    my $pending = $db->selectrow_hashref(
        "SELECT * FROM spell_choices_pending WHERE id = ? AND character_id = ? AND claimed = 0 AND (expires_at IS NULL OR expires_at > NOW()) AND token_expires_at > NOW() LIMIT 1",
        undef,
        $action->{pending_id},
        $char_id
    );
    if (!$pending) {
        return (0, 'no_pending', '');
    }

    if ($pending->{choice_token} ne $action->{choice_token}) {
        return (0, 'token_mismatch', '');
    }
    if ($pending->{menu_nonce} ne $action->{menu_nonce}) {
        return (0, 'menu_nonce_mismatch', '');
    }

    my $already_applied = $db->selectrow_hashref(
        "SELECT id FROM spell_choice_inbound_actions WHERE character_id = ? AND pending_id = ? AND status = 'applied' AND id <> ? LIMIT 1",
        undef,
        $char_id,
        $pending->{id},
        $action->{id}
    );
    if ($already_applied && $already_applied->{id}) {
        return (0, 'duplicate_pending_action', '');
    }

    my $chosen_spell_id = 0;
    if ($choice_index == 1) {
        $chosen_spell_id = int($pending->{spell_id_1});
    } elsif ($choice_index == 2) {
        $chosen_spell_id = int($pending->{spell_id_2});
    } else {
        $chosen_spell_id = int($pending->{spell_id_3});
    }

    if (!$chosen_spell_id) {
        return (0, 'invalid_choice', '');
    }

    my $spell = $db->selectrow_hashref(
        "SELECT id, name, IsDiscipline, skill, pcnpc_only_flag, npc_category FROM spells_new WHERE id = ? LIMIT 1",
        undef,
        $chosen_spell_id
    );
    if (!$spell) {
        return (0, 'spell_missing', '');
    }
    if ($spell->{IsDiscipline} == 1 || $spell->{skill} == 52) {
        return (0, 'discipline_not_allowed', '');
    }
    if (($spell->{pcnpc_only_flag} && $spell->{pcnpc_only_flag} == 2) || $spell->{npc_category} != 0) {
        return (0, 'npc_only_not_allowed', '');
    }

    my $updated = $db->do(
        "UPDATE spell_choices_pending SET claimed = 1, claimed_spell_id = ?, claimed_at = NOW() WHERE id = ? AND character_id = ? AND claimed = 0 AND choice_token = ? AND menu_nonce = ? AND token_expires_at > NOW() AND (expires_at IS NULL OR expires_at > NOW())",
        undef,
        $chosen_spell_id,
        $pending->{id},
        $char_id,
        $action->{choice_token},
        $action->{menu_nonce}
    );
    if (!$updated || $updated < 1) {
        return (0, 'already_claimed', '');
    }

    $db->do(
        "INSERT IGNORE INTO spell_choices_history (character_id, character_level, spell_id, source) VALUES (?, ?, ?, 'levelup_choice')",
        undef,
        $char_id,
        $pending->{character_level},
        $chosen_spell_id
    );

    if (!$client->HasSpellScribed($chosen_spell_id)) {
        $client->ScribeSpell($chosen_spell_id, -1);
    }

    return (1, '', $spell->{name});
}

sub sc_primary_class_label {
    my ($spell) = @_;

    my @labels = (
        '',
        'WAR', 'CLR', 'PAL', 'RNG', 'SHD', 'DRU', 'MNK', 'BRD',
        'ROG', 'SHM', 'NEC', 'WIZ', 'MAG', 'ENC', 'BST', 'BER'
    );

    my $best_level = 255;
    my $best_class = 0;
    for (my $i = 1; $i <= 16; $i++) {
        my $k = 'classes' . $i;
        my $lvl = int($spell->{$k});
        if ($lvl < $best_level) {
            $best_level = $lvl;
            $best_class = $i;
        }
    }

    if ($best_class < 1 || $best_class > 16 || $best_level >= 255) {
        return 'ANY';
    }

    return $labels[$best_class];
}

sub sc_json_escape {
    my ($s) = @_;
    if (!defined($s)) {
        return '';
    }

    $s =~ s/\\/\\\\/g;
    $s =~ s/"/\\"/g;
    $s =~ s/\r/\\r/g;
    $s =~ s/\n/\\n/g;
    return $s;
}

sub sc_chat_escape {
    my ($s) = @_;
    if (!defined($s)) {
        return '';
    }

    # Phase 1 transport is pipe-delimited chat payloads.
    $s =~ s/\|/\//g;
    $s =~ s/[\r\n]+/ /g;
    return $s;
}

sub sc_debug_log {
    my ($msg) = @_;
    warn($msg . "\n");
    return;
}
