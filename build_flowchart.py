import graphviz
from PIL import Image, ImageDraw, ImageFont

# ── shared graph defaults ────────────────────────────────────────────────────
GRAPH = dict(
    format='png',
    graph_attr=dict(
        rankdir='TB', splines='polyline',
        nodesep='0.55', ranksep='0.85',
        fontname='Helvetica Bold',
        labelloc='t', fontsize='22', fontcolor='#e8dfc8',
        pad='0.45', dpi='110',
    ),
    node_attr=dict(fontname='Helvetica', fontsize='12', margin='0.15,0.09', width='2.1'),
    edge_attr=dict(color='#6688aa', arrowsize='0.8',
                   fontname='Helvetica', fontsize='10', fontcolor='#99aacc'),
)

S = {
    'drop':    dict(fillcolor='#5c3a20', fontcolor='#f0dfc0', color='#d4a060', style='filled,rounded'),
    'cat':     dict(fillcolor='#1e3a1e', fontcolor='#a8e0a8', color='#60b060', style='filled,rounded'),
    'inter':   dict(fillcolor='#1a2d50', fontcolor='#b8cef0', color='#5888d0', style='filled,rounded'),
    'inter2':  dict(fillcolor='#142240', fontcolor='#90b4e8', color='#3a68b0', style='filled,rounded'),
    'pattern': dict(fillcolor='#3a1850', fontcolor='#d8a8f8', color='#9848d8', style='filled,rounded'),
    'armor':   dict(fillcolor='#402808', fontcolor='#ffd880', color='#e09030',
                    style='filled,rounded', penwidth='2'),
    'forge':   dict(fillcolor='#282830', fontcolor='#c0c0c0', color='#505060',
                    shape='diamond', style='filled', width='0.45', height='0.45', fontsize='16'),
}

def nd(g, nid, label, kind):
    g.node(nid, label=label, **{k: v for k, v in S[kind].items()})

def fnd(g, nid):
    g.node(nid, label='⚒', **S['forge'])

def ed(g, a, b, lbl=''):
    g.edge(a, b, label=lbl) if lbl else g.edge(a, b)


# ── tier data ────────────────────────────────────────────────────────────────
TIERS = ['T1 Weathered', 'T2 Reinforced', 'T3 Tempered', 'T4 Ascendant']

TIER_BG = {
    'cloth':   ['#0c1626', '#0c1c20', '#180c26', '#1e1808'],
    'leather': ['#1a1206', '#161a06', '#1e0812', '#1c1606'],
    'mail':    ['#081220', '#081812', '#12061c', '#1a1206'],
    'plate':   ['#181410', '#12180e', '#16101c', '#1c1406'],
}

CLOTH = [
    dict(fiber='Torn Fiber Scrap',      thread='Weak Binding Thread',
         bolt='Bolt of Woven Cloth',   pad='Cloth Padding',
         pat='Weathered Cloth Pattern',
         armor=['Weathered Cloth Robe','Weathered Cloth Trousers',
                'Weathered Cloth Cap','Weathered Cloth Sleeves',
                'Weathered Cloth Gloves','Weathered Cloth Bracers']),
    dict(fiber='Coarse Fiber Bundle',   thread='Coarse Linen Thread',
         bolt='Bolt of Coarse Linen',  pad='Reinforced Cloth Pad',
         pat='Reinforced Cloth Pattern',
         armor=['Reinforced Cloth Robe','Reinforced Cloth Trousers',
                'Reinforced Cloth Cap','Reinforced Cloth Sleeves',
                'Reinforced Cloth Gloves','Reinforced Cloth Bracers']),
    dict(fiber='Fine Silk Fibers',      thread='Strong Silk Thread',
         bolt='Bolt of Fine Silk',     pad='Silk-Quilted Pad',
         pat='Tempered Cloth Pattern',
         armor=['Tempered Cloth Robe','Tempered Cloth Trousers',
                'Tempered Cloth Cap','Tempered Cloth Sleeves',
                'Tempered Cloth Gloves','Tempered Cloth Bracers']),
    dict(fiber='Enchanted Fiber Bundle',thread='Enchanted Binding Thread',
         bolt='Bolt of Enchanted Silk',pad='Arcane Cloth Padding',
         pat='Ascendant Cloth Pattern',
         armor=['Ascendant Cloth Robe','Ascendant Cloth Trousers',
                'Ascendant Cloth Cap','Ascendant Cloth Sleeves',
                'Ascendant Cloth Gloves','Ascendant Cloth Bracers']),
]

LEATHER = [
    dict(hide='Frayed Hide Scrap',      sol='Basic Tanning Solution',
         sheet='Cured Leather Sheet',  panel='Leather Panel',
         pat='Weathered Leather Pattern',
         armor=['Weathered Leather Vest','Weathered Leather Pants',
                'Weathered Leather Cap','Weathered Leather Sleeves',
                'Weathered Leather Gloves','Weathered Leather Bracers']),
    dict(hide='Thick Animal Pelt',      sol='Moderate Tanning Solution',
         sheet='Hardened Leather Sheet',panel='Reinforced Leather Panel',
         pat='Reinforced Leather Pattern',
         armor=['Reinforced Leather Vest','Reinforced Leather Pants',
                'Reinforced Leather Cap','Reinforced Leather Sleeves',
                'Reinforced Leather Gloves','Reinforced Leather Bracers']),
    dict(hide='Supple Drake Hide',      sol='Superior Tanning Solution',
         sheet='Tempered Leather Sheet',panel='Tempered Leather Panel',
         pat='Tempered Leather Pattern',
         armor=['Tempered Leather Vest','Tempered Leather Pants',
                'Tempered Leather Cap','Tempered Leather Sleeves',
                'Tempered Leather Gloves','Tempered Leather Bracers']),
    dict(hide='Pristine Drake Hide',    sol='Mystic Tanning Solution',
         sheet='Ascendant Leather Sheet',panel='Ascendant Leather Panel',
         pat='Ascendant Leather Pattern',
         armor=['Ascendant Leather Vest','Ascendant Leather Pants',
                'Ascendant Leather Cap','Ascendant Leather Sleeves',
                'Ascendant Leather Gloves','Ascendant Leather Bracers']),
]

MAIL = [
    dict(ore='Rusted Metal Bit',         flux='Minor Tempering Flux',
         bar='Crude Refined Bar',        ring='Small Metal Ring',
         bundle='Weathered Chain Bundle',pat='Weathered Mail Pattern',
         armor=['Weathered Chain Hauberk','Weathered Chain Leggings',
                'Weathered Chain Coif','Weathered Chain Sleeves',
                'Weathered Chain Gloves','Weathered Chain Bracers']),
    dict(ore='Iron-Laced Ore Fragment',  flux='Standard Tempering Flux',
         bar='Tempered Iron Bar',        ring='Iron Ring',
         bundle='Reinforced Chain Bundle',pat='Reinforced Mail Pattern',
         armor=['Reinforced Chain Hauberk','Reinforced Chain Leggings',
                'Reinforced Chain Coif','Reinforced Chain Sleeves',
                'Reinforced Chain Gloves','Reinforced Chain Bracers']),
    dict(ore='Steel-Veined Ore Shard',   flux='High-Grade Tempering Flux',
         bar='Steel Alloy Bar',          ring='Steel Ring',
         bundle='Tempered Chain Bundle', pat='Tempered Mail Pattern',
         armor=['Tempered Chain Hauberk','Tempered Chain Leggings',
                'Tempered Chain Coif','Tempered Chain Sleeves',
                'Tempered Chain Gloves','Tempered Chain Bracers']),
    dict(ore='Mithril Ore Shard',        flux='Prime Celestial Flux',
         bar='Ascendant Refined Bar',    ring='Mithril Ring',
         bundle='Ascendant Chain Bundle',pat='Ascendant Mail Pattern',
         armor=['Ascendant Chain Hauberk','Ascendant Chain Leggings',
                'Ascendant Chain Coif','Ascendant Chain Sleeves',
                'Ascendant Chain Gloves','Ascendant Chain Bracers']),
]

PLATE = [
    dict(ore='Cracked Ore Chunk',        flux='Minor Tempering Flux',
         bar='Crude Refined Bar',        sheet='Rough Metal Sheet',
         sect='Rough Plate Section',     pat='Weathered Plate Pattern',
         armor=['Weathered Plate Breastplate','Weathered Plate Legplates',
                'Weathered Plate Helm','Weathered Plate Vambraces',
                'Weathered Plate Gauntlets','Weathered Plate Bracers']),
    dict(ore='Dense Iron Ore',           flux='Standard Tempering Flux',
         bar='Tempered Iron Bar',        sheet='Tempered Iron Sheet',
         sect='Tempered Plate Section',  pat='Reinforced Plate Pattern',
         armor=['Reinforced Plate Breastplate','Reinforced Plate Legplates',
                'Reinforced Plate Helm','Reinforced Plate Vambraces',
                'Reinforced Plate Gauntlets','Reinforced Plate Bracers']),
    dict(ore='High-Grade Ore Block',     flux='High-Grade Tempering Flux',
         bar='Steel Alloy Bar',          sheet='Steel Metal Sheet',
         sect='Hardened Plate Section',  pat='Tempered Plate Pattern',
         armor=['Tempered Plate Breastplate','Tempered Plate Legplates',
                'Tempered Plate Helm','Tempered Plate Vambraces',
                'Tempered Plate Gauntlets','Tempered Plate Bracers']),
    dict(ore='Adamantite Ore Block',     flux='Prime Celestial Flux',
         bar='Ascendant Refined Bar',    sheet='Mithril Sheet',
         sect='Ascendant Plate Section', pat='Ascendant Plate Pattern',
         armor=['Ascendant Plate Breastplate','Ascendant Plate Legplates',
                'Ascendant Plate Helm','Ascendant Plate Vambraces',
                'Ascendant Plate Gauntlets','Ascendant Plate Bracers']),
]


# ── panel generators ─────────────────────────────────────────────────────────
def cloth_panel(d, tier, bg, path):
    g = graphviz.Digraph(f'cloth_{tier}', **GRAPH)
    g.graph_attr.update(label=f'CLOTH — {tier}', bgcolor=bg)
    nd(g,'cf', f'{d["fiber"]}\n(×2, drop)',       'drop')
    nd(g,'ct', f'{d["thread"]}\n(×1, catalyst)',  'cat')
    fnd(g,'f1')
    nd(g,'bl', d['bolt'],                          'inter')
    nd(g,'ct2',f'{d["thread"]}\n(×1)',             'cat')
    fnd(g,'f2')
    nd(g,'pd', d['pad'],                           'inter2')
    nd(g,'pt', f'{d["pat"]}\n(nodrop)',            'pattern')
    nd(g,'ct3',f'{d["thread"]}\n(×1)',             'cat')
    fnd(g,'f3')
    for i,a in enumerate(d['armor']):
        nd(g,f'a{i}', a, 'armor')
    ed(g,'cf','f1'); ed(g,'ct','f1'); ed(g,'f1','bl')
    ed(g,'bl','f2','×2'); ed(g,'ct2','f2'); ed(g,'f2','pd')
    ed(g,'pd','f3','×N'); ed(g,'pt','f3'); ed(g,'ct3','f3')
    for i in range(6): ed(g,'f3',f'a{i}')
    g.render(path, cleanup=True)

def leather_panel(d, tier, bg, path):
    g = graphviz.Digraph(f'leath_{tier}', **GRAPH)
    g.graph_attr.update(label=f'LEATHER — {tier}', bgcolor=bg)
    nd(g,'lh', f'{d["hide"]}\n(×2, drop)',         'drop')
    nd(g,'ls', f'{d["sol"]}\n(×1, catalyst)',       'cat')
    fnd(g,'f1')
    nd(g,'sh', d['sheet'],                          'inter')
    nd(g,'ls2',f'{d["sol"]}\n(×1)',                 'cat')
    fnd(g,'f2')
    nd(g,'pn', d['panel'],                          'inter2')
    nd(g,'pt', f'{d["pat"]}\n(nodrop)',             'pattern')
    nd(g,'ls3',f'{d["sol"]}\n(×1)',                 'cat')
    fnd(g,'f3')
    for i,a in enumerate(d['armor']):
        nd(g,f'a{i}', a, 'armor')
    ed(g,'lh','f1'); ed(g,'ls','f1'); ed(g,'f1','sh')
    ed(g,'sh','f2','×2'); ed(g,'ls2','f2'); ed(g,'f2','pn')
    ed(g,'pn','f3','×N'); ed(g,'pt','f3'); ed(g,'ls3','f3')
    for i in range(6): ed(g,'f3',f'a{i}')
    g.render(path, cleanup=True)

def mail_panel(d, tier, bg, path):
    g = graphviz.Digraph(f'mail_{tier}', **GRAPH)
    g.graph_attr.update(label=f'MAIL — {tier}', bgcolor=bg)
    nd(g,'mo', f'{d["ore"]}\n(×2, drop)',           'drop')
    nd(g,'fl', f'{d["flux"]}\n(×1, catalyst)',      'cat')
    fnd(g,'f1')
    nd(g,'br', d['bar'],                            'inter')
    fnd(g,'f2')
    nd(g,'rg', f'{d["ring"]}  (×6 output)',        'inter2')
    fnd(g,'f3')
    nd(g,'bn', d['bundle'],                         'inter2')
    nd(g,'pt', f'{d["pat"]}\n(nodrop)',             'pattern')
    fnd(g,'f4')
    for i,a in enumerate(d['armor']):
        nd(g,f'a{i}', a, 'armor')
    ed(g,'mo','f1'); ed(g,'fl','f1'); ed(g,'f1','br')
    ed(g,'br','f2','×1 bar → 6 rings'); ed(g,'f2','rg')
    ed(g,'rg','f3','×6'); ed(g,'f3','bn')
    ed(g,'bn','f4','×N'); ed(g,'pt','f4')
    for i in range(6): ed(g,'f4',f'a{i}')
    g.render(path, cleanup=True)

def plate_panel(d, tier, bg, path):
    g = graphviz.Digraph(f'plate_{tier}', **GRAPH)
    g.graph_attr.update(label=f'PLATE — {tier}', bgcolor=bg)
    nd(g,'po', f'{d["ore"]}\n(×2, drop)',           'drop')
    nd(g,'fl', f'{d["flux"]}\n(×1, catalyst)',      'cat')
    fnd(g,'f1')
    nd(g,'br', d['bar'],                            'inter')
    fnd(g,'f2')
    nd(g,'sh', d['sheet'],                          'inter2')
    fnd(g,'f3')
    nd(g,'sc', d['sect'],                           'inter2')
    nd(g,'pt', f'{d["pat"]}\n(nodrop)',             'pattern')
    fnd(g,'f4')
    for i,a in enumerate(d['armor']):
        nd(g,f'a{i}', a, 'armor')
    ed(g,'po','f1'); ed(g,'fl','f1'); ed(g,'f1','br')
    ed(g,'br','f2','×2'); ed(g,'f2','sh')
    ed(g,'sh','f3','×2'); ed(g,'f3','sc')
    ed(g,'sc','f4','×N'); ed(g,'pt','f4')
    for i in range(6): ed(g,'f4',f'a{i}')
    g.render(path, cleanup=True)


# ── render all 16 panels ─────────────────────────────────────────────────────
configs = [
    ('cloth',   CLOTH,   cloth_panel),
    ('leather', LEATHER, leather_panel),
    ('mail',    MAIL,    mail_panel),
    ('plate',   PLATE,   plate_panel),
]

for atype, data, fn in configs:
    for i, (d, tier) in enumerate(zip(data, TIERS)):
        bg   = TIER_BG[atype][i]
        path = f'/tmp/fc_{atype}_t{i+1}'
        fn(d, tier, bg, path)
        print(f'  rendered {path}.png')


# ── stitch helpers ───────────────────────────────────────────────────────────
BG = (10, 10, 20)

def load(atype, tidx):
    return Image.open(f'/tmp/fc_{atype}_t{tidx}.png')

def pad_to(img, w, h, bg):
    if img.width == w and img.height == h:
        return img
    c = Image.new('RGB', (w, h), bg)
    c.paste(img, (0, 0))
    return c

def grid2x2(imgs):
    """Arrange 4 images [tl, tr, bl, br] into a 2×2 grid."""
    tl, tr, bl, br = imgs
    row_w = max(tl.width + tr.width, bl.width + br.width)
    col_h_top = max(tl.height, tr.height)
    col_h_bot = max(bl.height, br.height)
    tl = pad_to(tl, tl.width, col_h_top, BG)
    tr = pad_to(tr, tr.width, col_h_top, BG)
    bl = pad_to(bl, bl.width, col_h_bot, BG)
    br = pad_to(br, br.width, col_h_bot, BG)
    out = Image.new('RGB', (row_w, col_h_top + col_h_bot), BG)
    out.paste(tl, (0, 0))
    out.paste(tr, (tl.width, 0))
    out.paste(bl, (0, col_h_top))
    out.paste(br, (bl.width, col_h_top))
    return out

def add_header_footer(img, title, atype_label):
    W = img.width
    try:
        big  = ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf', 38)
        med  = ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf', 22)
        sm   = ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', 20)
    except Exception:
        big = med = sm = ImageFont.load_default()

    # header
    HDR = 80
    hdr = Image.new('RGB', (W, HDR), BG)
    d = ImageDraw.Draw(hdr)
    bbox = d.textbbox((0,0), title, font=big)
    tw = bbox[2]-bbox[0]
    d.text(((W-tw)//2, 18), title, fill='#e8dfc8', font=big)

    # tier labels (dividing line between T1/T2 and T3/T4)
    mid_x = img.width // 2
    sep = Image.new('RGB', (W, 3), (50, 50, 80))

    # footer / legend
    FTR = 180
    ftr = Image.new('RGB', (W, FTR), BG)
    fd  = ImageDraw.Draw(ftr)
    fd.text((20, 10), 'Legend:', fill='#e8dfc8', font=med)
    items = [
        ('#d4a060', 'Drop item (from NPCs)'),
        ('#60b060', 'Catalyst'),
        ('#5888d0', 'First intermediate'),
        ('#3a68b0', 'Second intermediate'),
        ('#9848d8', 'Pattern (nodrop — salvages on failed combine)'),
        ('#e09030', 'Final armor piece  (each combine → exactly 1 piece)'),
    ]
    col_w = W // 3
    y0 = 48
    for i, (col, lbl) in enumerate(items):
        cx = (i % 3) * col_w + 24
        cy = y0 + (i // 3) * 40
        fd.rectangle([cx, cy+4, cx+22, cy+24], fill=col, outline='#bbbbbb')
        fd.text((cx+32, cy), lbl, fill='#c8c8c8', font=sm)

    note = ('⚒ = Forge combine  |  ×N = quantity varies by slot  |  '
            'Slot weight:  Chest/Robe=4  ·  Legs=3  ·  Head/Arms=2  ·  Hands/Bracers=1')
    fd.text((24, y0 + 2*40 + 10), note, fill='#787888', font=sm)

    tier_bar = Image.new('RGB', (W, 36), (18, 18, 32))
    td = ImageDraw.Draw(tier_bar)
    half = W // 2
    for label, x in [('T1 Weathered  |  T2 Reinforced', 20),
                      ('T3 Tempered  |  T4 Ascendant',   half+20)]:
        td.text((x, 8), label, fill='#a0a0c0', font=med)
    td.line([(half, 0),(half, 36)], fill='#404060', width=2)

    total_h = HDR + 36 + img.height + FTR
    final = Image.new('RGB', (W, total_h), BG)
    final.paste(hdr,      (0, 0))
    final.paste(tier_bar, (0, HDR))
    final.paste(img,      (0, HDR + 36))
    final.paste(ftr,      (0, HDR + 36 + img.height))
    return final


# ── build one output image per armor type ────────────────────────────────────
TITLES = {
    'cloth':   'Cloth Armor Crafting — All Tiers (T1–T4)',
    'leather': 'Leather Armor Crafting — All Tiers (T1–T4)',
    'mail':    'Mail Armor Crafting — All Tiers (T1–T4)',
    'plate':   'Plate Armor Crafting — All Tiers (T1–T4)',
}

for atype, _, __ in configs:
    panels = [load(atype, i) for i in range(1, 5)]
    grid   = grid2x2(panels)
    final  = add_header_footer(grid, TITLES[atype], atype)
    out    = f'/src/blacksmithing_{atype}.png'
    final.save(out, dpi=(150,150))
    print(f'Saved {out}  ({final.width}×{final.height})')
