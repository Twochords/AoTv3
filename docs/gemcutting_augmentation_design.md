# Gem Cutting / Augmentation System Design

## Overview

Gem Cutting is a standalone tradeskill that produces augments for all crafted tradeskill gear.
It is entirely separate from Accessory Crafting (Lapidary), which produces wearable accessories.

Augments produced by Gem Cutting are interchangeable across all three crafting ecosystems:
- Armor Smithing
- Weapon Smithing
- Accessory Crafting (Lapidary)

---

## 1. Global Augment Slot Rules by Tier

All finished crafted items — armor, weapons, and accessories — follow the same slot progression:

| Tier | Augment Slots |
|------|--------------|
| T1 Weathered | 1 slot (augslot1 only) |
| T2 Reinforced | 1 slot (augslot1 only) |
| T3 Tempered | 2 slots (augslot1 + augslot2) |
| T4 Ascendant | 2 slots (augslot1 + augslot2) |

This applies to every finished crafted item without exception. Drop materials, intermediates,
molds, patterns, and catalysts do not receive augment slots — only finished wearable/wieldable
output items.

---

## 2. Augment Compatibility Model

A single shared augment slot type is used across the entire crafting ecosystem.

### Design Principle

Any Gem Cutting augment fits into any crafted tradeskill item that has an augment slot.
There are no armor-only, weapon-only, or accessory-only augments. A player who crafts a
Gem Cutting augment can slot it into whichever crafted piece they choose.

### Item Type Restriction

Gem Cutting augments use `augrestrict=0`. This disables the item-type filter entirely and
allows the augment to be inserted into any item that accepts the matching augment slot type,
regardless of whether that item is armor, weapon, or jewelry.

### Lore Group Restriction

Gem Cutting augments do not use a lore group. The same augment name can be worn in multiple
slots simultaneously (e.g., one in an armor piece and one in a weapon). This is intentional —
players can duplicate augments across different items to build their loadout freely.

---

## 3. EQEmu Augment Slot Type Strategy

### Slot Type: 10 (bit_AugTypeCraftedCommon, bitmask value 512)

EQEmu augment slot types are defined as bit flags. Slot type 10 corresponds to the custom
range used for server-defined augment categories. This project uses type 10 as the single
dedicated slot for the entire custom crafting ecosystem.

| Field | Value | Meaning |
|-------|-------|---------|
| Crafted item `augslot1type` | 10 | Accepts augment type 512 |
| Crafted item `augslot2type` | 10 | Accepts augment type 512 |
| Augment item `augtype` | 512 | Fits into slot type 10 |

The relationship between slot type (10) and augment type value (512) follows EQEmu's
bitmask convention: `augtype = 1 << slot_type = 1 << 9 = 512`.

### Why Type 10

Standard EQEmu servers use types 1–8 for live-era augment categories (type 1 = general,
type 4 = weapon-specific, etc.). Type 10 is unused by default and does not conflict with
any vanilla item in the game. Using a single dedicated type guarantees that no retail item
can accidentally accept a custom augment, and no retail augment can be slotted into custom
gear.

### Visibility

All augment slots use `augslotNvisible=1`. Slots are shown to players in the item inspection
window so they know augment slots are present and which are filled.

---

## 4. Crafted Gear Update Rules

### 4a. Armor Smithing

All finished armor items (all four armor types, all six slots, all four tiers) receive
augment slots according to the tier rules above. Intermediates (bars, bolts, sheets, etc.)
and patterns are excluded.

| Tier | Items | Slot Config |
|------|-------|-------------|
| T1 Weathered | 147520–147546 (slots != 0) | augslot1type=10 |
| T2 Reinforced | 147568–147591 (slots != 0) | augslot1type=10 |
| T3 Tempered | 147612–147635 (slots != 0) | augslot1type=10, augslot2type=10 |
| T4 Ascendant | 147656–147679 (slots != 0) | augslot1type=10, augslot2type=10 |

The `slots != 0` guard ensures that any intermediate items sharing the ID range are not
accidentally given augment slots. All finished armor items have non-zero equip slots.

### 4b. Weapon Smithing

All finished weapons (1H/2H slashing, blunt, piercing), shields, and bows receive augment
slots according to the tier rules above. Billets, blanks, staff cores, and molds are excluded.

| Tier | Weapons | Shield | Bow | Slot Config |
|------|---------|--------|-----|-------------|
| T1 Weathered | 147800–147813 | 147860 | 147868 | augslot1type=10 |
| T2 Reinforced | 147814–147827 | 147861 | 147869 | augslot1type=10 |
| T3 Tempered | 147828–147841 | 147862 | 147870 | augslot1type=10, augslot2type=10 |
| T4 Ascendant | 147842–147855 | 147863 | 147871 | augslot1type=10, augslot2type=10 |

### 4c. Accessory Crafting (Lapidary)

All finished accessories (Ring, Earring, Necklace, Mask, Belt, Cloak) receive augment
slots according to the tier rules above. Drop materials, intermediates, molds, and settings
are excluded.

| Tier | Accessories | Slot Config |
|------|-------------|-------------|
| T1 Weathered | 147892–147897 | augslot1type=10 |
| T2 Reinforced | 147921–147926 | augslot1type=10 |
| T3 Tempered | 147950–147955 | augslot1type=10, augslot2type=10 |
| T4 Ascendant | 147979–147984 | augslot1type=10, augslot2type=10 |

---

## 5. Gem Cutting Augment Item Rules

### Item Type

Gem Cutting augments use `itemtype=54` (EQEmu augment item type). They are not equippable
as standalone gear — they exist only to be placed into augment slots.

### Augment Fields

| Field | Value | Notes |
|-------|-------|-------|
| `augtype` | 512 | Fits slot type 10 on all crafted items |
| `augrestrict` | 0 | No item-type restriction; fits armor, weapons, accessories |
| `augdistiller` | 0 | No distiller required to remove the augment |
| `magic` | 1 | All augments are magical |
| `nodrop` | 0 | Freely tradeable (same as weapon smithing items) |
| `norent` | 0 | Persists across sessions |
| `stackable` | 0 | Augments do not stack; each is a distinct item |

### Equip Slots on Augments

Augment items have an `slots` field that controls which equipped slots they can be inserted
into. To support all crafted item categories, augments should use a value that covers at
minimum: Ear, Neck, Face, Finger, Chest, Arms, Wrist, Hands, Legs, Primary, Secondary,
Range, and Waist. The value `2072574` covers this range and is used in the existing T1
augment items.

If the value `2072574` is found to exclude specific accessory slots (e.g., Cloak at slot 256,
Waist at slot 1048576), it should be updated to `3121150` or the specific missing bit should
be OR'd in when accessory augment slot support is verified in-game.

### Gem Cutting Stat Lines

Two stat lines are planned for the initial expansion. Additional gem types can be added per
tier as the system expands.

| Augment Family | Primary Stat | Gem Type |
|---------------|-------------|---------|
| Vitality | +HP | Garnet family |
| Clarity | +Mana | Aquamarine family |

Stats scale per tier:

| Tier | Vitality (+HP) | Clarity (+Mana) |
|------|---------------|----------------|
| T1 Weathered | +10 HP | +10 Mana |
| T2 Reinforced | +25 HP | +25 Mana |
| T3 Tempered | +60 HP | +60 Mana |
| T4 Ascendant | +150 HP | +150 Mana |

Scaling is intentionally slower than the base armor stat doubling to keep augments as a
meaningful but not dominant contribution. A full T4 build with two T4 augments per slot
adds augment value on top of the base item stats rather than replacing them.

### Crafting Chain (all tiers)

```
Rough Gem × 2 + Grindstone → Faceted Gem
Faceted Gem × 2 + Gem Polish → Polished Gem
Polished Gem + Augment Setting (salvages) → Finished Augment
```

The setting salvages on a failed final combine, protecting the player from total loss at
the highest-skill step. The grindstone is consumed in the first step. Gem Polish is shared
between Lapidary and Gem Cutting (same item ID per tier).

### Container

All Gem Cutting recipes use the Gem Cutting Station (item 147985) as their container.
This container is a world object in Dranik's Scar and also functions as a recipe filter
(`iscontainer=1, item_id=147985`). No other container can be used for Gem Cutting combines.

### Tradeskill

Gem Cutting uses `tradeskill=61` (Jewelry Making). This is shared with Lapidary / Accessory
Crafting. The same skill governs both systems and advances from either. This is intentional —
players who invest in jewelry crafting benefit from both accessory and augment production.

---

## 6. Balance Impact Analysis

### Base Stats Unchanged

All crafted armor, weapon, and accessory stats remain exactly as designed. Augment slots
are an additive customization layer and do not change any existing stat values.

### Augment Contribution at Each Tier

A player with one T1 augment in one T1 armor piece gains +10 HP. This is minor relative
to the armor's stat contribution and does not shift the power level of T1 gear meaningfully.

At T4, a player with two T4 augments in a single item gains +300 HP or +300 Mana from those
slots. This is meaningful at high end but represents a significant Gem Cutting investment.

### Opportunity Cost

Gem Cutting shares the Jewelry Making skill cap and the same zone-tier drop pools as
Lapidary. Players choosing to produce augments are competing for the same drop time as
players producing accessories. This creates a genuine tradeoff without introducing a new
resource type.

### T3/T4 Double Slot Value

The second augment slot at T3/T4 provides meaningful extra customization without changing
the item's base identity. A T3 chest with two Vitality augments is tankier; the same chest
with one Vitality and one Clarity is more balanced. This is a player choice, not a balance
lever that requires tuning.

---

## 7. Anti-Exploit Rules

### Augment Distiller

`augdistiller=0` — augments can be removed from items without a distiller. This prevents
distiller scarcity from becoming a sink that traps players in bad augment choices, and
removes any incentive to exploit item duplication as a distiller bypass.

### No Retail Slot Bleed

Augment type 512 (slot type 10) does not appear on any retail EQ item. No retail augment
has `augtype` bits that include 512 unless explicitly added by this server. This ensures:
- Custom augments cannot be inserted into retail gear
- Retail augments cannot be inserted into custom crafted gear
- The custom augment economy is fully isolated from retail loot

### No Lore Group Stacking Exploit

Augments have no lore group restriction, which is intentional — the same augment can be
used in multiple items simultaneously. This does not create an exploit because augments are
not equippable standalone items and have no resale value pathway that bypasses crafting.

### Nodrop / Norent Rules

Finished augments are `nodrop=0, norent=0` (freely tradeable). This is consistent with
weapon smithing items and allows a player-driven augment economy. Because augments require
crafting skill and multiple intermediate steps, raw vendor acquisition of high-tier augments
is not possible.

### Drop Item Availability

Gem raw materials (Rough Garnet, Rough Aquamarine, etc.) are dropped by zone-appropriate
mobs at rates similar to other tradeskill drops (15% raw, 10% catalyst). They are not
vendor-sold. This ensures augment production is gated by zone progression, the same
constraint that applies to the rest of the crafting ecosystem.

---

## 8. Future Expansion Recommendations

### Additional Gem Families

Two gem families (Vitality/Clarity) cover HP and Mana. Natural expansions:

| Family | Stat | Gem Type |
|--------|------|---------|
| Resilience | +AC | Onyx family |
| Precision | +ATK | Ruby family |
| Warding | +All Resists | Sapphire family |
| Swiftness | +Haste | Emerald family |

Each new family follows the same three-step crafting chain and uses the same augtype=512
so new augments immediately work in all existing crafted gear without SQL updates to items.

### Dual-Stat Augments (High-Tier Expansion)

A future T5 tier or an endgame refinement system could introduce dual-stat augments
(e.g., +HP and +ATK on the same augment) using the same augtype=512 and slot type 10.
No schema changes are required — only new augment item and recipe entries.

### Augment Slot Count Expansion

The current design caps at 2 augment slots. If a future tier 5 is introduced, the
recommended extension is 3 slots (augslot3type=10) for T5 only. Keeping the cap at 2
for T1–T4 preserves the current balance model. Do not retroactively add slots to
existing tiers — that changes relative tier value.

### Augment Upgrade Path

A future system could allow combining two same-tier augments with a catalyst to produce
the next tier's augment. This would make excess augments tradeable as raw material for
uptiering, creating a sink for lower-tier drops in high-tier zones. The crafting chain
would use the Gem Cutting Station (same container) and require no new container items.

### Class-Specific Augment Variants

All current augments use `classes=65535` (all classes). A future expansion could introduce
class-filtered augment families (e.g., a Caster Clarity with higher mana gain but
`classes=<caster bitmask>`) while reusing the same slot type. This preserves compatibility
— the slot accepts any type-512 augment; class filtering only controls who can equip the augment item.

---

## System Boundaries

| System | Container | Skill | Output |
|--------|-----------|-------|--------|
| Gem Cutting | Gem Cutting Station (147985) | Jewelry Making (61) | Augments (augtype=512) |
| Accessory Crafting | Lapidary's Workbench (147872) | Jewelry Making (61) | Wearable accessories |
| Armor Smithing | Forge (various IDs) | Blacksmithing (63) | Wearable armor |
| Weapon Smithing | Weapon Smith Forge (147680) | Blacksmithing (63) | Weapons, shields, bows |

Gem Cutting and Accessory Crafting share the Jewelry Making skill. Armor and Weapon Smithing
share the Blacksmithing skill. The systems do not share containers — a recipe written for the
Gem Cutting Station cannot be performed at the Lapidary's Workbench and vice versa.
