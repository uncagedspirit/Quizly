# Quizly — Design System

> Spring-fresh, confident, alive. Crisp blocks, generous space, one bold accent per screen.

**Theme support:** light + dark
**Palette story:** Moss (deep forest green primary, with warm secondary accents)
**Typography voice:** Modern (Geist sans throughout — no serif italics)
**Density:** comfortable — 4px base grid
**Shape language:** crisp & geometric, small-to-medium radii (4–16px), sharp blocks

Quizly's UI is built on a warm cream canvas (light) or near-black soil (dark), accented by a single dominant moss green for brand surfaces. Hero cards take colored "blocks" — terracotta, peach, gold — to introduce energy where the moment calls for it. Everything else stays calm: white cards, thin lines, generous vertical rhythm. Decoration is restricted to small confetti dots in spring colors that scatter across hero bands. No gradients, no glow, no glass.

The product positioning is "casual but premium-feeling" — it must not look like a school tool or a toy. Use these tokens as written; the look depends on them.

---

## Design Philosophy

- **Light, not bulky** — every element earns its space. Borders before shadows. Flat color before gradient. No drop shadows on every card.
- **Calm energy** — bold colors used sparingly, against generous white space. One accent moment per screen.
- **Industry-standard refinement** — follow the spatial and typographic norms of Notion, Linear, Things, Headspace. Avoid AI-template tropes.
- **Sharp blocks, soft surfaces** — radii stay small (mostly 8–14px). Hero cards can go to 16–18px. Avatars and chips never go full circle — quizzes are scoreboards, not feeds.
- **Numbers are the hero** — scores, codes, ranks, timers. They are large, monospaced or Geist-display, and given air.

---

## Color Palette

### Brand & Accent (identical across light/dark)

These are the constant colors. They sit on top of the neutral substrate and never change.

| Token | Hex | Role |
|---|---|---|
| `brand` (light) | `#506834` | Deep moss — primary brand, CTA fills, "Live" badge |
| `brand` (dark) | `#B9CD38` | Lime — in dark mode the brand brightens for contrast |
| `brand-ink` (light) | `#F5F1E2` | Cream text on moss CTA |
| `brand-ink` (dark) | `#141A0C` | Soil text on lime CTA |
| `warm` | `#D77204` | Terracotta — hero blocks (challenge, hardest-question, second CTA) |
| `gold` | `#E2A50F` | Mustard — podium 2nd place, decorative dot |
| `yellow` | `#F9E761` | Chartreuse — success band, icon backgrounds, decorative dot |
| `peach` | `#F1A791` | Soft pink — quiz cards, mini avatars, hero blocks |
| `moss` | `#506834` | Same as brand — leaderboard fills, secondary blocks |
| `correct` (light) | `#506834` | Moss — correct-answer reveal |
| `correct` (dark) | `#B9CD38` | Lime — correct in dark mode |
| `wrong` (light) | `#D77204` | Terracotta — wrong-answer reveal |
| `wrong` (dark) | `#E2864B` | Softer terracotta in dark mode |

### Neutrals — Light Mode

| Token | Hex | Use |
|---|---|---|
| `paper` | `#EEE9D6` | Page background — warm parchment |
| `paper-2` | `#E5DFC6` | Subtle info panels, inset rows, "Did you know" callouts |
| `card` | `#FFFFFF` | All card backgrounds — kept pure white against parchment |
| `line` | `rgba(26,36,16,0.10)` | Card borders, dividers, soft separators |
| `ink` | `#1A2410` | Primary text, dark CTA backgrounds, sharp UI elements |
| `ink-2` | `#3D4B2A` | Secondary text |
| `ink-3` | `rgba(26,36,16,0.55)` | Tertiary text, captions, eyebrows |
| `ink-4` | `rgba(26,36,16,0.18)` | Empty progress segments, divider lines, ghost states |

### Neutrals — Dark Mode

| Token | Hex | Use |
|---|---|---|
| `paper` | `#141A0C` | Page background — soil |
| `paper-2` | `#1C2412` | Inset rows, callouts |
| `card` | `#212A15` | Card backgrounds |
| `line` | `rgba(238,233,214,0.08)` | Borders, dividers |
| `ink` | `#EEE9D6` | Primary text, light CTA backgrounds |
| `ink-2` | `#BDB494` | Secondary text |
| `ink-3` | `rgba(238,233,214,0.55)` | Tertiary text |
| `ink-4` | `rgba(238,233,214,0.16)` | Empty segments, ghost states |

### Accent Adjustments in Dark Mode

A handful of accents soften slightly for legibility on dark substrate:

| Token | Light | Dark | Reason |
|---|---|---|---|
| `brand` | `#506834` | `#B9CD38` | Moss disappears on soil; lime pops |
| `brand-ink` | `#F5F1E2` | `#141A0C` | Text on brand fill |
| `warm` | `#D77204` | `#E2864B` | Saturated terracotta vibrates on dark |
| `gold` | `#E2A50F` | `#F0BC4A` | Lift saturation slightly |
| `moss` | `#506834` | `#7A9554` | Lighter for dark mode podium fills |

### Semantic Colors

| Token | Maps to | Use |
|---|---|---|
| `success` | `correct` | Right-answer tile, "+120 points" banner |
| `warning` | `warm` | Timer about to expire, "Hardest question" card |
| `danger` | `wrong` | Wrong-answer tile, delete actions |
| `info` | `gold` | Informational tooltips, deadline pills |

---

## Typography

### Font Families

- **UI / Display / Body** — `Geist` (weights 400, 500, 600, 700, 800)
- **Mono** — `JetBrains Mono` (weights 500, 600, 700) — quiz codes only

> **Voice — Modern.** Geist runs the entire app. No serif italics anywhere. Hero numbers and headlines use Geist Display weights (700, 800) with tight negative letter-spacing to feel confident, not flowery. This is what separates Quizly from a school app.

### Type Scale

| Token | Family | Size | Line Height | Weight | Letter-spacing | Use |
|---|---|---|---|---|---|---|
| `display-xxl` | Geist | 86px | 0.92 | 800 | -0.034em | "Quizly." on splash |
| `display-xl` | Geist | 56px | 0.92 | 800 | -0.028em | Score number (results, share) |
| `display-lg` | Geist | 44px | 1.0 | 700 | -0.023em | "Welcome back" hero, "It's live." |
| `display-md` | Geist | 36px | 1.0 | 700 | -0.028em | Greeting "Sam.", page heroes |
| `display-sm` | Geist | 32px | 1.05 | 700 | -0.019em | Question text, large section heroes |
| `heading-lg` | Geist | 22px | 1.15 | 700 | -0.018em | Hero card titles ("90s Pop Trivia") |
| `heading-md` | Geist | 18px | 1.2 | 700 | -0.01em | Section titles ("Recent attempts") |
| `heading-sm` | Geist | 16px | 1.25 | 700 | -0.013em | Button labels, option tile text |
| `body-lg` | Geist | 15px | 1.4 | 500 | 0 | Long-form (descriptions, callouts) |
| `body-md` | Geist | 14px | 1.4 | 500 | -0.014em | Default body, list item titles |
| `body-sm` | Geist | 13px | 1.45 | 500 | 0 | Card secondary text, helper rows |
| `body-xs` | Geist | 12px | 1.45 | 500 | 0 | Captions, fine print |
| `label-md` | Geist | 13px | 1.3 | 600 | -0.015em | Form labels, tab labels |
| `label-sm` | Geist | 12px | 1.3 | 600 | 0 | Chip text, secondary controls |
| `overline` | Geist | 11px | 1.3 | 600 | 0.06em UPPERCASE | Eyebrows ("RECENT ATTEMPTS"), section labels |
| `mono-lg` | JetBrains Mono | 32px | 1.0 | 600 | 0 | Code slots when big = true (publish screen) |
| `mono-md` | JetBrains Mono | 24px | 1.0 | 600 | 0 | Default code slots (home, code entry) |
| `mono-sm` | JetBrains Mono | 13px | 1.0 | 600 | 0 | Inline code labels ("QZ4X9K"), counters |
| `mono-xs` | JetBrains Mono | 11px | 1.0 | 500 | 0 | Time stamps (1:42, 2:14) on leaderboard rows |

### Type Rules

- **No italics.** Modern voice never uses `font-style: italic`.
- **Negative tracking on display.** Headings above 22px always carry tight tracking (–0.018em to –0.034em scaling with size). Body keeps default tracking (0).
- **Overline is uppercase, 0.06em tracking, weight 600.** Always used as a section eyebrow above content blocks.
- **`tabular-nums` on all numerals** in scores, timers, leaderboards. Use `font-variant-numeric: tabular-nums`.
- **`text-wrap: pretty`** on display-md and larger to prevent rivers on multi-line headlines.

---

## Spacing Scale

4px base grid. No off-grid values except for optical alignment in icon glyphs.

| Token | Value | Use |
|---|---|---|
| `space-1` | 4 | Tightest inline gap (chip icons, inline runs) |
| `space-2` | 6 | Pip gaps, leaderboard row vertical padding |
| `space-3` | 8 | Default inline gap between related elements, button gaps |
| `space-4` | 10 | Card internal vertical rhythm, option-tile padding |
| `space-5` | 12 | Default vertical gap between siblings, card padding tight |
| `space-6` | 14 | Card content padding, hero-card stat rows |
| `space-7` | 16 | Section internal padding, hero card body padding |
| `space-8` | 18 | Hero card horizontal padding (the most common big-card pad) |
| `space-9` | 22 | Standard screen horizontal padding |
| `space-10` | 26 | Rhythm between unrelated sections |
| `space-11` | 32 | Large block separation |
| `space-12` | 38 | Hero top padding (after status bar) |
| `space-13` | 56 | Splash, empty-state vertical anchor |

### Screen Edge Padding (canonical)

- Default screen horizontal padding: **22px** (`space-9`)
- Top padding below status bar: **56px** (status bar + breathing room)
- Bottom padding above home indicator: **36px**

These three values are non-negotiable across all 19 reference screens.

---

## Border Radius

| Token | Value | Use |
|---|---|---|
| `radius-xs` | 4 | Tag chips, rank squares, podium tops, top progress pips |
| `radius-sm` | 6 | Avatar squares, key bubbles, small color icons |
| `radius-md` | 8 | Buttons, settings rows, segmented control chips, keypad keys |
| `radius-lg` | 10 | Default cards, option tiles, input fields, leaderboard rows |
| `radius-xl` | 12 | Larger cards (stat tiles, callouts, hardest-question card) |
| `radius-2xl` | 14 | FAB (floating create button), nested feature cards |
| `radius-hero` | 16 | Hero cards (publish success, score reveal, challenge, code-entry strip) |
| `radius-hero-lg` | 18 | Largest hero moments (score reveal hero) |
| `radius-full` | 9999 | Reserved — currently unused; pills are radius-md (8) by default |

**Rule:** never go beyond 18. Avatars use `radius-sm` (6), not circles. Buttons use `radius-md` (8–10), not pills. Quiz aesthetic = scoreboard, not chat.

---

## Borders

- **Default border weight:** **1.5px**, not 1px. Against the cream paper, 1px reads as a hairline that disappears at typical viewing distance.
- **`box-shadow: inset 0 0 0 1.5px var(--qz-line)`** is used in place of CSS `border` everywhere to keep layout dimensions unaffected.
- **Dividers between rows in a card:** 1px solid `line`. (One pixel is fine for *internal* separation because the card boundary already gives the read.)
- **Focused/selected state:** 1.5px or 2px solid `ink` (most contexts) or `brand` (option tile in editor).

---

## Shadows

Shadows are used **sparingly**. Default cards have **no shadow** — they sit on the paper with a 1.5px line. Shadows are reserved for genuinely floating elements.

| Token | Definition | Use |
|---|---|---|
| `shadow-card` | `0 1px 0 var(--qz-line)` | Default card bottom edge (acts as a "set-on-paper" hint, not a lift) |
| `shadow-fab` | `0 8px 24px rgba(0,0,0,0.2), 0 2px 6px rgba(0,0,0,0.15)` | Floating action button (the only true elevation) |
| `shadow-icon-button` | `0 1px 2px rgba(0,0,0,0.08)` | Active segmented-control tab |

That is the entire shadow vocabulary. No `shadow-md`, no `shadow-lg`. The "1px 0" shadow is the canonical card chrome.

---

## Iconography

- **Library:** custom sharp-line SVGs (1.8–2.2px stroke), already defined in `QzIcon` (Plus, Arrow, Back, Check, Cross, Share, Copy, Grip, Clock, Trophy, Bolt, Dots).
- **Stroke weight:** **1.8px** standard, **2px** on action arrows + plus, **2.2px** on the close X, **2.4px** on the check (it needs to read at small sizes against colored fills).
- **Filled fallbacks:** Bolt and Trophy and grip dots are solid fills — these need the visual weight.
- **Sizes:**

| Token | Size | Use |
|---|---|---|
| `icon-xs` | 12 | Inline with body-xs, chip eyebrow icons |
| `icon-sm` | 14 | Inline with body-md, leaderboard rank glyphs |
| `icon-md` | 16 | Default button icons, primary CTA gleam |
| `icon-lg` | 18 | Option tile checkmarks, hero card icons |
| `icon-xl` | 22 | Top bar back/close |

- **Color:** inherits from text color of surrounding context unless intentionally an accent.
- **Material Symbols substitute:** if Material Symbols is your icon source instead of custom SVGs, use the **Outlined** variant at weight 400 (500 for filled/active). The intent is the same: sharp lines, moderate weight, no rounded-decorative variants.
- **Emoji policy:** emojis are NOT primary affordances. The one allowed use is the 📋 paste hint on code-entry. No emoji avatars; use colored-block initials.

---

## Motion & Animation

### Timing functions

- `ease-standard`: `cubic-bezier(0.3, 0.7, 0.4, 1)` — default for most UI transitions
- `ease-emphasis`: `cubic-bezier(0.2, 1.6, 0.4, 1)` — bouncy spring for celebratory moments (correct answer, code pop-in, score reveal)
- `ease-decel`: `cubic-bezier(0, 0, 0.2, 1)` — for screen transitions

### Durations

- `dur-instant`: 100ms — taps, toggles
- `dur-fast`: 200ms — default UI transitions
- `dur-medium`: 320ms — screen transitions, progress bar fill
- `dur-slow`: 500ms — code-slot stagger reveal
- `dur-celebration`: 700ms — score number count-up

### Page Transitions

- Default: slide-from-right (`SharedAxisTransition` horizontal) — 320ms / `ease-decel`
- Modal: fade up from bottom — 280ms
- Auth flow: cross-fade — 250ms

### Micro-interactions

- **Tap press:** all tappable elements scale to 0.97 on press, 100ms / `ease-standard`
- **Toggle switch:** 200ms / `cubic-bezier(.3, 1.4, .4, 1)` (defined inline as `QzToggle` slide)
- **Code-slot reveal:** stagger 60ms per slot, each slot pops via `qz-pop` keyframe — 500ms / `ease-emphasis` (defined globally; see Animation Library)
- **Confetti dots on hero bands:** they don't animate — they are static decoration. Restraint over noise.
- **Timer bar drain:** width transitions linearly via `transform: scaleX(...)`. No keyframe — driven by JS state per second.
- **Progress pips on submit:** the current pip transitions from `ink-4` → `ink` over 300ms

### Animation Library (global keyframes)

```css
@keyframes qz-pop {
  0%   { transform: scale(0.6) rotate(-8deg); opacity: 0 }
  60%  { transform: scale(1.08) rotate(3deg);  opacity: 1 }
  100% { transform: scale(1)    rotate(0);     opacity: 1 }
}
@keyframes qz-drain {
  from { transform: scaleX(1) }
  to   { transform: scaleX(0) }
}
@keyframes qz-cursor {
  50% { opacity: 0 }
}
```

### Score Reveal (results hero)

- Score number counts from `0/N` to final value over 700ms with `ease-emphasis`
- Stat pills stagger in with 80ms delay each, slide up 8px + fade in, 320ms / `ease-decel`
- Confetti dots fade in over 500ms, no movement

---

## Component Specifications

### Buttons

All buttons: **`radius-md` (10px)**, **`tap-scale 0.97 / 100ms`** on press.

#### Primary Button (`QzButton kind="primary"`)
- Height: **56px** (lg), 46px (md), 38px (sm)
- Horizontal padding: full-width by default; when not full, 18px horizontal
- Border radius: **10px**
- Background: `brand` (moss `#506834` light / lime `#B9CD38` dark)
- Text: `heading-sm` (16px / 600 weight)
- Text color: `brand-ink` (cream light / soil dark)
- Icon: `icon-md` to the right of label, 10px gap

#### Dark Button (`QzButton kind="dark"`)
Same dimensions. Background `ink`, text `paper`. Used for "Get started" CTAs and "Share to apps…" — moments where the moss brand would compete with another color block above.

#### Secondary Button (`QzButton kind="secondary"`)
Same dimensions. Background transparent, text `ink`. Border: `box-shadow: inset 0 0 0 1.5px var(--qz-ink)`. Used as a balanced co-CTA next to a primary.

#### Ghost Button (`QzButton kind="ghost"`)
Same dimensions. Background transparent, text `ink-2`. No border. Used for "Skip", "Maybe later".

#### Warm Button (`QzButton kind="warm"`)
Same dimensions. Background `warm` (`#D77204`), text `#fff`. Reserved for second-tier CTAs on results / challenge contexts.

#### Icon Button (utility)
- 34–36px square touch area
- Visual 16–22px icon centered
- Background: `card` on top-bar utility actions (with `shadow-card`)
- Hover/press: tinted at 10% opacity of `ink`

### Input Fields

#### Text Input
- Height: **52px** for stand-alone, **44px** in dense lists
- Background: `card` (white) — inputs feel like cards
- Border: `box-shadow: inset 0 0 0 2px var(--qz-ink)` when focused, `1.5px var(--qz-line)` at rest
- Border radius: **10px**
- Padding: 16–18px horizontal, 12–18px vertical
- Text: `heading-sm` (16–24px depending on importance)
- Placeholder: `ink-3`
- Focus shows a 2px blinking cursor (`qz-cursor` keyframe) at the end of input

#### Code Slot (`QzCodeSlots`)
The signature input — 6 individual blocks for the QZ-prefixed code.

- Slot size: **44×52px** (default) or **56×64px** (`big=true`, used on publish-success)
- Gap between slots: 6px (default) or 8px (big)
- Empty slot: transparent fill, `inset 0 0 0 1.5px var(--qz-ink4)` border (or `var(--qz-ink)` when focused)
- Filled slot: `card` background, `shadow-card`
- Text: **JetBrains Mono 600** at 24px (default) or 32px (big), color `ink`
- Border radius: **8px** per slot
- When `pop=true`: each slot animates in with `qz-pop` keyframe, 60ms stagger per slot

### Cards

#### Default Content Card
- Padding: **12–14px** depending on density (use 14px for primary content, 12px for list rows)
- Border radius: **10px**
- Background: `card`
- Elevation: `shadow-card` only (`0 1px 0 var(--qz-line)`). Never a real drop shadow.
- Internal dividers: 1px solid `line`

#### Hero Card (colored block)
The "one accent per screen" moment.

- Padding: **22px** all sides (or 22 horizontal / 26–30 vertical for taller heroes)
- Border radius: **16px** (default) or **18px** (largest moments — score reveal)
- Background: one of `brand`, `warm`, `peach`, `ink`, `yellow`
- Text color: contrast pair (cream on dark, soil on light, white on `warm`)
- Confetti dots: 3–5 dots in spring colors, scattered via absolute positioning, sized 6–14px, rotated -20° to 20°
- Pseudo-decoration: optional 120px-radius soft disc bottom-right at 0.4 opacity — used only on quiz-preview peach card

#### Stat Tile (`QzStatPill`)
- Padding: **12–16px**
- Border radius: **10px**
- Background: `card`
- Layout: value on top (Geist 24px / 32px, weight 600, tabular-nums), label below (overline)
- Value color: defaults to `ink`; passes accent (`correct`, `wrong`) when meaningful

#### Quiz List Row
- Padding: **12px vertical, 14px horizontal**
- Border radius: **10–12px**
- Background: `card`
- Layout: 38–50px color block (radius-sm or radius-md, big-letter inside) → 12px gap → text column → trailing score / chip
- Color block: rotates through `peach`, `yellow`, `moss`, `gold`, `ink4` based on hash or category

### Chips / Badges (`QzChip`)

- Padding: **5px vertical, 9px horizontal**
- Border radius: **6px** (consistent across all chip types)
- Text: `label-sm` (12px / 600 weight)
- Background: one of the soft accent fills or `ink-4`
- Strong variant: adds `inset 0 0 0 1.5px var(--qz-ink)` outline for emphasis (used on deadline chip)

### Segmented Control (Tab Switcher)

- Container background: `ink-4`
- Container padding: **3–4px**
- Container border radius: **9–10px**
- Tab: 9–10px vertical padding, equal-flex width
- Inactive tab: transparent, `ink-3` text
- Active tab: `card` background, `ink` text, `shadow-icon-button`

### Option Tile (Quiz Question)

The chunky answer block — these are the heart of the play experience.

- Padding: **14px vertical, 14px horizontal**
- Border radius: **10px**
- Background: `card`
- Layout: **36×36** letter block (radius-sm, 6px) → 14px gap → label text → optional checkmark badge
- Letter block: filled with one of `peach`, `yellow`, `gold`, `moss` rotating through A/B/C/D
- Letter text: Geist 700 / 16px, color `ink` (or white on the moss block)
- Selected state: `box-shadow: inset 0 0 0 2.5px var(--qz-ink)` + filled circle checkmark at right (22px circle, `ink` fill, white check)
- Correct state (reveal mode): background swaps to `correct`, text + letter block become white-on-transparent overlay
- Wrong state (reveal mode): opacity 0.5

### Timer Bar (`QzTimerBar`)

- Height: **6px**
- Track: full-width, `ink-4` background, **3px radius**
- Fill: `transform: scaleX(pct)` from origin `0 50%`, `warm` color when ≤ 50%, `brand` otherwise
- Transition: 0.2s linear on transform (smooth tick-down)

### Progress Pips (`QzProgressPips`)

- Height: **3px** per pip
- Gap: **4px**
- Each pip flexes equally to fill container width
- Done pips: `ink`
- Pending pips: `ink-4`
- Border radius: 2px per pip

### Toggle Switch (`QzToggle`)

- Track: **44×26px**, radius **13px** (capsule)
- Track off: `ink-4`
- Track on: `brand` (moss / lime)
- Thumb: **20×20px** white, radius **10px**, with `0 1px 3px rgba(0,0,0,0.18)` shadow
- Thumb travel: 3px → 21px, 250ms cubic-bezier(.3, 1.4, .4, 1) — a confident overshoot

### Leaderboard Row (full)

- Padding: **9px vertical, 12px horizontal**
- Border radius: **9px**
- Background: `card` (default) or `paper-2` (you-row)
- You-row: adds `box-shadow: inset 0 0 0 1.5px var(--qz-ink)`
- Layout: 26px rank → 28px avatar block → name (flex 1) → mono time → score number
- Rank typography: Geist 700 / 20px, slightly larger and tighter on first place
- Score typography: Geist 600 / 18px, tabular-nums

### Podium (top of full leaderboard)

- Three column blocks, **96px wide** each
- Heights: 1st = **150px**, 2nd = **110px**, 3rd = **90px**
- Block top: rounded `8px 8px 0 0`
- Block fill: `gold` / `warm` / `brand` respectively
- Top of each: 42px avatar block + name (Geist 700 / 14px) + score (Geist 600 / 22px tabular-nums)
- Inside block: large rank numeral (Geist 700 / 36px, ink) — top-aligned, 8px padding-top

### Floating Action Button (FAB)

- **56×56px** square (not circle)
- Border radius: **14px**
- Background: `brand`
- Icon: `Plus`, 22px, color `brand-ink`
- Elevation: `shadow-fab`
- Position: `right: 22px, bottom: 96px` (above home indicator + tab area)

### Dialog / Modal

- Border radius: **18px**
- Padding: **24px**
- Max width: 360px (centered on tablets)
- Background: `card`
- Title: `heading-md`
- Body: `body-md`
- Action row: 8–10px gap between buttons

### Bottom Sheet

- Border radius: **18px** on top corners only
- Top handle: 36px wide, 4px tall, color `line`, centered, 12px margin
- Content padding: 22px horizontal, 22px top after handle, 36px bottom (safe area)

---

## Screen-Level Layout

### Standard Screen Structure

```
QzPhone (iOS frame, 402×874)
└── QzScreen (padTop: 56, padBottom: 36, padX: 22)
    └── Column
        ├── TopBar (back / title / action) — 22–34px tall
        ├── space-7 (16–22px gap)
        ├── Content
        │   ├── Section eyebrow (overline)
        │   ├── Content blocks
        │   └── ... (vertical rhythm: 18–26px between sections)
        └── Bottom action row (when present)
```

### TopBar Composition

- Height: **22–34px** (the back-arrow / X owns the height; no explicit container)
- Left: back arrow or X (22px icon, no padding chrome)
- Center: optional small label (`label-md` color `ink-3`) or code-pill (`mono-sm`) or progress pips
- Right: optional action icon (Dots, Share) or text action ("Done", "Save")
- All three slots share the same baseline; never grow the bar to fit content — squeeze content instead

### Bottom Action Bar (for screens with submit/next)

- Padding: 0 top, 36px bottom (the safe area inside `QzScreen`)
- Layout: 8px gap between buttons when there are two
- Common patterns:
  - Single primary: `<QzButton kind="primary" />` full-width
  - Two-button row: `<QzButton kind="ghost" flex={1} />` + `<QzButton kind="primary" flex={1.5} />`
  - Three-button: avoid; collapse to "More" overflow

---

## Light vs Dark Mode

Both modes share the **same brand and accent palette** at the conceptual level, but two tokens swap to keep the moss brand visible:

| Token | Light | Dark |
|---|---|---|
| `brand` | `#506834` (deep moss) | `#B9CD38` (lime) |
| `brand-ink` | `#F5F1E2` | `#141A0C` |
| `correct` | `#506834` | `#B9CD38` |
| `wrong` | `#D77204` | `#E2864B` |
| `moss` (decorative) | `#506834` | `#7A9554` |

Everything else — `warm`, `gold`, `yellow`, `peach` — stays identical across modes.

### Dark-mode adjustments to neutrals

- `paper` → `#141A0C` (soil)
- `paper-2` → `#1C2412`
- `card` → `#212A15` (NOT pure black — the card surface stays warm)
- `line` → `rgba(238,233,214,0.08)` — lighter and lower alpha to avoid hard edges
- All `ink-*` flip to cream-tinted off-whites (see Neutrals — Dark Mode table)

### What does NOT change

- All radii, spacing, typography sizes, weights, line-heights, letter-spacing
- All accent hex values except the four flips above
- All shadow definitions (they still apply against dark substrate)
- Animation timings and curves

---

## Empty States

- Center the content vertically inside the body area
- Top: 56px decorative emoji or simple icon (avoid SVG illustrations beyond a single shape)
- Below: `heading-md` title
- Below: `body-md` description in `ink-3`, max-width 280px, `text-wrap: pretty`
- Below: optional `QzButton kind="primary"` (full-width)
- Vertical gap between elements: 12px

Example for "no quizzes yet":

```
        🌱
   No quizzes yet
Create your first quiz to share
       with friends.

[      Create quiz      ]
```

---

## Loading States

- **Full-screen loading:** centered ring indicator, color `brand`, size 28px
- **Inline loading:** 16px ring, color inherits from surrounding text
- **Skeletons:** rounded rectangles (radius-md or matching the slot), background `ink-4`, no shimmer — keep it calm
- **Code-slot loading:** each slot pulses opacity 0.4 → 1 → 0.4 over 1.2s with 80ms stagger

---

## Error States

- **Inline form error:** 8px below input, `body-sm`, color `danger` (`wrong`)
- **Screen-level error:** empty-state pattern, warm-tinted icon, retry primary button
- **Snackbar errors:** full-width at bottom, 12px padding, `card` background, `shadow-card`, 1px top border `danger`, text `ink-2`. Auto-dismiss at 4s.

---

## Image / Avatar Treatment

- User avatars in MVP are colored-block initials (no photo upload, no emoji avatars)
- Avatar background rotates through: `peach`, `yellow`, `gold`, `warm`, `moss`, `brand` (hash by name)
- Anonymous avatars: `ink-4` background, `?` glyph in `ink-2`
- Avatar shape: **`radius-sm` (6px)** — slight rounding, NOT circles
- Standard sizes: **26px** (leaderboard row), **28–34px** (top-bar / header), **42px** (podium), **48px** (challenge sender)
- Initial typography: Geist 700, size = 42% of avatar size, color `ink` or contrasting fill

---

## Quiz Card Color Rotation

Each quiz gets a category color for its block-letter thumbnail. Rotate through:

| Category bucket | Block color | Block ink |
|---|---|---|
| Music / pop | `peach` | `ink` |
| Geography / general | `yellow` | `ink` |
| Sports | `gold` | `ink` |
| Science / nature | `moss` | white |
| TV / film | `warm` | white |
| Draft / no category | `ink-4` | `ink` |

The block contains the first letter of the quiz title in **Geist 600 / 22px** (the only place we use a serif-display-like size on something that isn't a true headline — and it stays Geist).

---

## Iconography for Common Actions

| Action | Icon glyph in `QzIcon` | Material Symbols fallback |
|---|---|---|
| Back | `Back` | `arrow_back` |
| Close | `Cross` | `close` |
| Share | `Share` | `ios_share` |
| More | `Dots` | `more_horiz` |
| Add | `Plus` | `add` |
| Copy | `Copy` | `content_copy` |
| Next | `Arrow` | `arrow_forward` |
| Reorder grip | `Grip` | `drag_indicator` |
| Timer | `Clock` | `timer` |
| Trophy / rank | `Trophy` | `emoji_events` |
| Power / spark | `Bolt` | `bolt` |
| Correct | `Check` | `check` |
| Wrong | `Cross` | `close` |

---

## Do's and Don'ts

### Do
- Use **one accent color block** per screen as the visual anchor; everything else stays calm.
- Use **solid colors** over gradients always. The brand has gradient-free clarity.
- Use **borders before shadows**. Default cards have a 1px line, not a drop shadow.
- Use **Geist** for everything text-shaped. No exceptions other than `JetBrains Mono` for quiz codes.
- Use **tabular-nums** on all numeric displays (scores, timers, codes).
- Use **negative tracking** on display headlines (-0.018em to -0.034em).
- Use **`text-wrap: pretty`** on multi-line headlines.

### Don't
- Don't add drop shadows to every card. The 1px line is the chrome.
- Don't use circles for avatars or buttons. We're a scoreboard, not a feed.
- Don't mix multiple accent colors aggressively. One hero color per screen.
- Don't use italic. Modern voice has no italic.
- Don't use emoji as primary UI affordances.
- Don't use neon, glow, or gradient effects.
- Don't go above radius 18. Sharp blocks beat soft pillows.
- Don't use Inter, Roboto, Arial, or any system font. Geist or nothing.

---

## Reference Tokens — CSS Custom Properties

Drop this at the top of `:root` (light mode defaults; the `[data-theme="dark"]` block flips the four neutrals + brand pair).

```css
:root {
  /* — Brand & accent — */
  --qz-brand:        #506834;
  --qz-brand-ink:    #F5F1E2;
  --qz-warm:         #D77204;
  --qz-gold:         #E2A50F;
  --qz-yellow:       #F9E761;
  --qz-peach:        #F1A791;
  --qz-moss:         #506834;
  --qz-correct:      #506834;
  --qz-wrong:        #D77204;

  /* — Neutrals (light) — */
  --qz-paper:        #EEE9D6;
  --qz-paper-2:      #E5DFC6;
  --qz-card:         #FFFFFF;
  --qz-line:         rgba(26, 36, 16, 0.10);
  --qz-ink:          #1A2410;
  --qz-ink-2:        #3D4B2A;
  --qz-ink-3:        rgba(26, 36, 16, 0.55);
  --qz-ink-4:        rgba(26, 36, 16, 0.18);

  /* — Typography — */
  --qz-font-ui:      'Geist', ui-sans-serif, system-ui, -apple-system, sans-serif;
  --qz-font-mono:    'JetBrains Mono', ui-monospace, SFMono-Regular, Menlo, monospace;

  /* — Type scale (size / line-height / weight / tracking) — */
  --qz-display-xxl:  800 86px/0.92 var(--qz-font-ui);
  --qz-display-xl:   800 56px/0.92 var(--qz-font-ui);
  --qz-display-lg:   700 44px/1.00 var(--qz-font-ui);
  --qz-display-md:   700 36px/1.00 var(--qz-font-ui);
  --qz-display-sm:   700 32px/1.05 var(--qz-font-ui);
  --qz-heading-lg:   700 22px/1.15 var(--qz-font-ui);
  --qz-heading-md:   700 18px/1.20 var(--qz-font-ui);
  --qz-heading-sm:   700 16px/1.25 var(--qz-font-ui);
  --qz-body-lg:      500 15px/1.40 var(--qz-font-ui);
  --qz-body-md:      500 14px/1.40 var(--qz-font-ui);
  --qz-body-sm:      500 13px/1.45 var(--qz-font-ui);
  --qz-body-xs:      500 12px/1.45 var(--qz-font-ui);
  --qz-label-md:     600 13px/1.30 var(--qz-font-ui);
  --qz-label-sm:     600 12px/1.30 var(--qz-font-ui);
  --qz-overline:     600 11px/1.30 var(--qz-font-ui);
  --qz-mono-lg:      600 32px/1.00 var(--qz-font-mono);
  --qz-mono-md:      600 24px/1.00 var(--qz-font-mono);
  --qz-mono-sm:      600 13px/1.00 var(--qz-font-mono);
  --qz-mono-xs:      500 11px/1.00 var(--qz-font-mono);

  /* — Tracking helpers — */
  --qz-track-display: -0.025em;
  --qz-track-heading: -0.015em;
  --qz-track-overline: 0.06em;

  /* — Spacing — */
  --qz-space-1:   4px;
  --qz-space-2:   6px;
  --qz-space-3:   8px;
  --qz-space-4:  10px;
  --qz-space-5:  12px;
  --qz-space-6:  14px;
  --qz-space-7:  16px;
  --qz-space-8:  18px;
  --qz-space-9:  22px;
  --qz-space-10: 26px;
  --qz-space-11: 32px;
  --qz-space-12: 38px;
  --qz-space-13: 56px;

  /* — Radii — */
  --qz-radius-xs:    4px;
  --qz-radius-sm:    6px;
  --qz-radius-md:    8px;
  --qz-radius-lg:   10px;
  --qz-radius-xl:   12px;
  --qz-radius-2xl:  14px;
  --qz-radius-hero: 16px;
  --qz-radius-hero-lg: 18px;

  /* — Shadows — */
  --qz-shadow-card:        0 1px 0 var(--qz-line);
  --qz-shadow-fab:         0 8px 24px rgba(0,0,0,0.20), 0 2px 6px rgba(0,0,0,0.15);
  --qz-shadow-icon-btn:    0 1px 2px rgba(0,0,0,0.08);

  /* — Borders — */
  --qz-border-line:        inset 0 0 0 1.5px var(--qz-line);
  --qz-border-strong:      inset 0 0 0 1.5px var(--qz-ink);
  --qz-border-focus:       inset 0 0 0 2px   var(--qz-ink);
  --qz-border-selected:    inset 0 0 0 2.5px var(--qz-ink);

  /* — Motion — */
  --qz-ease-standard: cubic-bezier(0.3, 0.7, 0.4, 1);
  --qz-ease-emphasis: cubic-bezier(0.2, 1.6, 0.4, 1);
  --qz-ease-decel:    cubic-bezier(0, 0, 0.2, 1);
  --qz-dur-instant:   100ms;
  --qz-dur-fast:      200ms;
  --qz-dur-medium:    320ms;
  --qz-dur-slow:      500ms;
  --qz-dur-celebration: 700ms;
}

/* — Dark mode flip — */
[data-theme="dark"] {
  --qz-brand:        #B9CD38;   /* lime in dark */
  --qz-brand-ink:    #141A0C;
  --qz-correct:      #B9CD38;
  --qz-wrong:        #E2864B;
  --qz-warm:         #E2864B;
  --qz-gold:         #F0BC4A;
  --qz-moss:         #7A9554;

  --qz-paper:        #141A0C;
  --qz-paper-2:      #1C2412;
  --qz-card:         #212A15;
  --qz-line:         rgba(238, 233, 214, 0.08);
  --qz-ink:          #EEE9D6;
  --qz-ink-2:        #BDB494;
  --qz-ink-3:        rgba(238, 233, 214, 0.55);
  --qz-ink-4:        rgba(238, 233, 214, 0.16);
}

/* — Global keyframes — */
@keyframes qz-pop {
  0%   { transform: scale(0.6) rotate(-8deg); opacity: 0 }
  60%  { transform: scale(1.08) rotate(3deg);  opacity: 1 }
  100% { transform: scale(1)    rotate(0);     opacity: 1 }
}
@keyframes qz-drain {
  from { transform: scaleX(1) }
  to   { transform: scaleX(0) }
}
@keyframes qz-cursor {
  50% { opacity: 0 }
}
```

---

## Reference Tokens — Flutter / Dart

Mirror the CSS tokens in a single `lib/core/theme/tokens.dart`. No magic numbers anywhere else.

```dart
class QzColors {
  // Brand & accent (light)
  static const brandLight     = Color(0xFF506834);
  static const brandInkLight  = Color(0xFFF5F1E2);
  static const warmLight      = Color(0xFFD77204);
  static const goldLight      = Color(0xFFE2A50F);
  static const yellow         = Color(0xFFF9E761);
  static const peach          = Color(0xFFF1A791);
  static const mossLight      = Color(0xFF506834);
  static const correctLight   = Color(0xFF506834);
  static const wrongLight     = Color(0xFFD77204);

  // Brand & accent (dark)
  static const brandDark      = Color(0xFFB9CD38);
  static const brandInkDark   = Color(0xFF141A0C);
  static const warmDark       = Color(0xFFE2864B);
  static const goldDark       = Color(0xFFF0BC4A);
  static const mossDark       = Color(0xFF7A9554);
  static const correctDark    = Color(0xFFB9CD38);
  static const wrongDark      = Color(0xFFE2864B);

  // Neutrals (light)
  static const paperLight     = Color(0xFFEEE9D6);
  static const paper2Light    = Color(0xFFE5DFC6);
  static const cardLight      = Color(0xFFFFFFFF);
  static const lineLight      = Color(0x1A1A2410);
  static const inkLight       = Color(0xFF1A2410);
  static const ink2Light      = Color(0xFF3D4B2A);
  static const ink3Light      = Color(0x8C1A2410);
  static const ink4Light      = Color(0x2E1A2410);

  // Neutrals (dark)
  static const paperDark      = Color(0xFF141A0C);
  static const paper2Dark     = Color(0xFF1C2412);
  static const cardDark       = Color(0xFF212A15);
  static const lineDark       = Color(0x14EEE9D6);
  static const inkDark        = Color(0xFFEEE9D6);
  static const ink2Dark       = Color(0xFFBDB494);
  static const ink3Dark       = Color(0x8CEEE9D6);
  static const ink4Dark       = Color(0x29EEE9D6);
}

class QzSpacing {
  static const s1 =  4.0;
  static const s2 =  6.0;
  static const s3 =  8.0;
  static const s4 = 10.0;
  static const s5 = 12.0;
  static const s6 = 14.0;
  static const s7 = 16.0;
  static const s8 = 18.0;
  static const s9 = 22.0;
  static const s10 = 26.0;
  static const s11 = 32.0;
  static const s12 = 38.0;
  static const s13 = 56.0;
}

class QzRadius {
  static const xs       =  4.0;
  static const sm       =  6.0;
  static const md       =  8.0;
  static const lg       = 10.0;
  static const xl       = 12.0;
  static const xxl      = 14.0;
  static const hero     = 16.0;
  static const heroLg   = 18.0;
}

class QzDur {
  static const instant      = Duration(milliseconds: 100);
  static const fast         = Duration(milliseconds: 200);
  static const medium       = Duration(milliseconds: 320);
  static const slow         = Duration(milliseconds: 500);
  static const celebration  = Duration(milliseconds: 700);
}

class QzEase {
  static const standard = Cubic(0.3, 0.7, 0.4, 1);
  static const emphasis = Cubic(0.2, 1.6, 0.4, 1);
  static const decel    = Cubic(0, 0, 0.2, 1);
}
```

Register as a `ThemeExtension` so widgets read `context.colors.brand` instead of hard-coding.

```dart
class QzTheme extends ThemeExtension<QzTheme> {
  final Color brand;
  final Color brandInk;
  final Color paper;
  final Color card;
  final Color ink;
  // ... etc

  static QzTheme light() => QzTheme(
    brand: QzColors.brandLight,
    brandInk: QzColors.brandInkLight,
    paper: QzColors.paperLight,
    card: QzColors.cardLight,
    ink: QzColors.inkLight,
  );

  static QzTheme dark() => QzTheme(
    brand: QzColors.brandDark,
    brandInk: QzColors.brandInkDark,
    paper: QzColors.paperDark,
    card: QzColors.cardDark,
    ink: QzColors.inkDark,
  );

  @override QzTheme copyWith({...}) => ...;
  @override QzTheme lerp(QzTheme? other, double t) => ...;
}
```

---

## Agent Prompt Guide

Quick reference for an agent building a new screen:

**Layout boilerplate.** Wrap every screen in `QzPhone → QzScreen(padTop: 56, padBottom: 36, padX: 22)`. Inside, top-bar row → 16–22px gap → content → flex spacer → bottom action.

**Pick one accent block.** Each screen gets exactly one hero card in a brand color. Everything else: white cards + thin lines.

**Default font.** Geist 500 for body, Geist 700/800 for display. No italics, ever. Use mono only for codes and times.

**Default card.** `var(--qz-card)` bg, `var(--qz-radius-lg)` (10px), `var(--qz-shadow-card)` only — no real shadow. Internal padding 14px.

**Default button.** `kind="primary"` is moss (light) or lime (dark) on the brand-ink text. Use `kind="dark"` when there's already a brand accent above and you want the CTA not to compete.

**Default tap interaction.** scale 0.97 / 100ms / `ease-standard`. On celebratory moments only (code reveal, score reveal, correct answer), use `ease-emphasis` (the spring overshoot).

**Component-prompt examples:**

> **Build a Quiz List Row.** `var(--qz-card)` background, `var(--qz-radius-lg)` (10px), `var(--qz-shadow-card)`, padding 12px vertical / 14px horizontal. Left: 38×38 block (radius-sm, 6px) tinted `var(--qz-peach)` with the first letter inside in Geist 600 / 22px ink. 12px gap. Center: title in `var(--qz-body-md)` weight 600 ink. Below it, `var(--qz-body-xs)` in `var(--qz-ink-3)`. Right: score number in Geist 600 / 22px tabular-nums, ink.

> **Build the Hero Code Card on Home.** `var(--qz-ink)` background, cream text, `var(--qz-radius-hero)` (16px), padding 22px / 20px. Top: tiny overline "GOT A CODE?" in 55% white. Below: large display "Let's play." in Geist 700 / 30px tracking `-0.02em`. Below: 14px-padded rgba-white-6% inset with the 6-slot code input. Below: 50px full-width brand button "Join quiz". Decorative: two confetti dots top-right (brand 10px, gold 6px).

> **Build the Score Reveal Hero.** `var(--qz-brand)` background, brand-ink text, `var(--qz-radius-hero-lg)` (18px), padding 30px / 22px, centered. Top: tiny overline "YOUR SCORE" 70% opacity. Center: Geist 800 / 104px / line-height 1, "9" full-opacity + "/12" at 56% opacity 55% alpha. Below: heading-sm "Sharper than 73% of players." 4 confetti dots positioned absolutely at corners (warm 10px, yellow 6px, peach 12px, gold 8px), each rotated 15–25°. Below the hero card (outside): 4-up stat tile row with Correct / Wrong / Rank / Time.

---

## File Structure (Flutter)

```
lib/
├── core/
│   └── theme/
│       ├── tokens.dart           # QzColors, QzSpacing, QzRadius, QzDur, QzEase
│       ├── qz_theme.dart         # ThemeExtension light/dark
│       ├── text_styles.dart      # Geist + JetBrains Mono TextStyle helpers
│       └── theme.dart            # ThemeData light() / dark() builders
├── ui/
│   ├── components/               # QzButton, QzCard, QzCodeSlots, QzTimerBar, ...
│   ├── primitives/               # QzPhone (test rig), QzScreen
│   └── motion/                   # QzPop, QzPress, QzScoreReveal animations
└── features/
    ├── onboarding/
    ├── home/
    ├── take/
    ├── results/
    ├── create/
    └── dashboard/
```

Every widget references tokens via `context.theme.extension<QzTheme>()!`. Numeric magic-numbers are forbidden outside `tokens.dart`.
