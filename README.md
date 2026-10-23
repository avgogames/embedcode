# Embed code: printables tabs

A tabbed box for your website with three tabs: **Science Coloring**, **Math Coloring** and **Math Worksheets** (Grade 1 to 6, each with Worksheets PDF and Answer key buttons).

Paste this where the tabs should appear:

```html
<div data-spiderclimbs-tabs></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/tabs.js" defer></script>
```

The script and all the pages and PDFs load from this repo through the free jsDelivr CDN, so you don't have to upload anything. It works in any site builder that lets you add custom HTML.

## Options

Add these to the `<div>`:

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-tab` | `data-tab="worksheets"` | Tab that opens first: `science`, `math` or `worksheets` |
| `data-tabs` | `data-tabs="worksheets"` | Which tabs to show, in order, separated by commas |
| `data-base` | `data-base="https://example.com/printables/"` | Load the files from your own server instead. Copy the repo folders there unchanged. |

For example, a worksheets-only box:

```html
<div data-spiderclimbs-tabs data-tabs="worksheets"></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/tabs.js" defer></script>
```

You can put several boxes on one page; load the script once.

## Notes

- jsDelivr caches `@main` for up to 12 hours, so new files can take that long to show. For a fixed version, use a commit instead of `main`, for example `@95e935c`.
- The styles all start with `sct`, so they won't clash with your site's CSS.
- The tabs work with the keyboard (arrow keys, Home, End) and screen readers.
- `tabs-demo.html` in this folder is a demo page using the embed code (`index.html` is the same page).

# Embed code: Spider Climb Typing game

A typing tutor game for kids. Every correct letter helps a spider climb its web to the star. The game has 8 levels: Home Row Hop, Home Row Words, Top Row Climb, Bottom Row Dive, Science Words, Math Words, Number Sums and Super Sentences. A color-coded keyboard lights up the next key and names the finger to use. At the end of each round, kids get speed (words per minute), accuracy and up to 3 stars. Stars are saved in the browser.

Paste this where the game should appear:

```html
<div data-spiderclimbs-typing></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/typing.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-level` | `data-level="5"` | Start straight in a level (1 to 8) instead of the level picker |
| `data-sound` | `data-sound="off"` | Start with sound off. Kids can still turn it on with the speaker button. |

The game works best with a real keyboard. On phones and tablets, tapping the word box opens the on-screen keyboard. `typing-demo.html` in this folder is a demo page.

# Embed code: Math Flash Cards

A flash card game for grades 1 to 6, with 10 levels in each grade (60 levels in all). Each level is 10 cards. Kids type the answer, or tap it on the number pad, and the card flips to show if it's right. 6 or more right passes the level and opens the next one, and 10 out of 10 earns 3 stars. Wrong cards are listed at the end to practice. Stars are saved in the browser.

Paste this where the game should appear:

```html
<div data-spiderclimbs-flashcards></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/flashcards.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-grade` | `data-grade="3"` | Open one grade's levels straight away |
| `data-unlock` | `data-unlock="all"` | Open every level from the start (good for teachers) |
| `data-sound` | `data-sound="off"` | Start with sound off |

| Grade | Levels 1 to 10 |
| --- | --- |
| 1 | Add to 5, take away from 5, add to 10, take away from 10, make 10, add to 20, take away from 20, missing numbers, three numbers, count by tens |
| 2 | Doubles, subtract to 20, 2-digit + 1-digit, add tens, 2-digit + 2-digit, 2-digit − 2-digit, times 2/5/10, times 3 and 4, divide by 2/5/10, hundreds |
| 3 | Times 2 to 5, times 6 to 9, all times tables, divide by 2 to 5, divide by 6 to 10, missing factor, add & subtract hundreds, fraction of a number, times tens, mixed review |
| 4 | Times 11 and 12, 2-digit × 1-digit, times 100 and 1,000, divide 2-digit numbers, equivalent fractions, add fractions, subtract fractions, add tenths, rounding, mixed review |
| 5 | Add decimals, subtract decimals, decimals × 10/100/1,000, divide by 10 and 100, 2-digit × 2-digit, add unlike fractions, fraction × whole number, fraction × fraction, order of operations, mixed review |
| 6 | Decimal × decimal, divide fractions, percent of a number, add integers, subtract integers, multiply & divide integers, exponents, solve for x, greatest common factor, mixed review |

Cards are made fresh each game, so no two games are the same. Fraction answers can be typed as 3/4 or 1 1/2, and any equal fraction counts (6/8 is right for 3/4). `flashcards-demo.html` in this folder is a demo page.

# Embed code: Adding with Carrying animation

An animated, step-by-step column addition. It lines the numbers up under place-value labels (O, T, H, Th, and so on), adds one column at a time from the ones, writes the answer digit, and shows the carried digit jumping up to the top of the next column. Each step explains what's happening in plain words. Kids can play it, pause it, step back and forward, change the speed, try a random problem, or type their own sum (2 to 4 numbers, up to 7 digits).

Paste this where the animation should appear:

```html
<div data-spiderclimbs-carry></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/carry.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-numbers` | `data-numbers="2468+1357"` | The sum shown first (default 478 + 356) |
| `data-autoplay` | `data-autoplay="true"` | Start playing straight away |
| `data-speed` | `data-speed="slow"` | `slow`, `normal` or `fast` |
| `data-input` | `data-input="off"` | Hide the box for typing your own sum, for a fixed lesson example |

`carry-demo.html` in this folder is a demo page.

# Embed code: Subtraction, Multiplication and Division animations

Three step-by-step animations that work the same way as Adding with Carrying: Play/Pause, Back, Next, Start over, Slow/Normal/Fast speed, a random problem button, and a box for typing your own problem. Every step is explained in plain words.

- **Subtracting with Borrowing:** works one column at a time from the ones. When the top digit is too small, it crosses it out and borrows from the next place, including across zeros (4002 − 1357), with a "+10" jumping over to the column that needs it. Ends with a check by adding.
- **Long Multiplication:** multiplies by each digit of the bottom number, shows each carry jumping to the next column, adds the placeholder zeros, then adds the rows. The bottom number can have up to 3 digits.
- **Long Division:** follows Divide, Multiply, Subtract, Bring down, with each brought-down digit jumping into place. It shows the remainder with R and ends with a check. Divisors can be 1 to 99, and dividends can have up to 6 digits.

One script serves all three. Put any of the divs on a page and load the script once:

```html
<div data-spiderclimbs-subtract></div>
<div data-spiderclimbs-multiply></div>
<div data-spiderclimbs-divide></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/arithmetic.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-problem` | `data-problem="4002-1357"`, `"47x36"`, `"952/7"` | The problem shown first |
| `data-autoplay` | `data-autoplay="true"` | Start playing straight away |
| `data-speed` | `data-speed="slow"` | `slow`, `normal` or `fast` |
| `data-input` | `data-input="off"` | Hide the box for typing your own problem |

`arithmetic-demo.html` in this folder is a demo page with all three.

# Embed code: Trace & Learn (letters and numbers)

A tracing game for capital letters (A–Z), small letters (a–z) and numbers (0–9), drawn on handwriting lines. For each character, a pencil first shows how to write it, one stroke at a time in the right order. Then kids trace it with a finger or mouse. A numbered green dot shows where each stroke starts, and an arrow shows which way to go. The ink only moves forward when they follow the line in the right direction. If they wander off the line, it wiggles and they carry on from where they stopped.

Finishing a character gives a star burst and a ✓ on its button (saved in the browser). Letters show a picture word ("A is for Apple 🍎"), and numbers show that many things to count.

Paste this where the game should appear:

```html
<div data-spiderclimbs-tracing></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/tracing.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-set` | `data-set="numbers"` | First set to show: `upper`, `lower` or `numbers` |
| `data-sets` | `data-sets="upper,lower"` | Which sets to offer |
| `data-char` | `data-char="G"` | First character to show |
| `data-sound` | `data-sound="off"` | Start with sound off |

`tracing-demo.html` in this folder is a demo page.

# Embed code: Pixel Art by Number

A color-by-number game with 117 pixel pictures in seven topics: Animals (1–17), Plants (18–34), Planets and space (35–51), Cars (52–68), Christmas (69–84), Halloween (85–100) and Anime (101–117). The Anime pictures are 12 original chibi characters drawn for this game (not characters from any show) plus onigiri, ramen, dango, a carp streamer and a torii gate.

- **Gallery:** pictures show 36 at a time, in a 6 × 6 grid. Each one has its picture number, a progress bar, and a grey preview that fills with color as it's painted. Topic buttons filter the list, and page buttons move between pages.
- **Coloring:** every square on the 24 × 24 grid has a number, including the patterned background. Picking a color from the numbered dots at the bottom darkens every square with that number. Tap a square to color it, or press and hold and drag to color lots of squares. Only the right number takes the color.
- **Tools:** pencil, fill bucket (colors a whole patch of the same number), hand (to move around when zoomed in), hint (flashes where the chosen color goes), and zoom in and out.
- **Progress:** finished colors get a ✓, and the game moves on to the next color by itself. Progress is saved in the browser. Finishing a picture shows it full size with confetti.

Paste this where the game should appear:

```html
<div data-spiderclimbs-pixelart></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/pixelart.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-topic` | `data-topic="halloween"` | Open the gallery on one topic: `animals`, `plants`, `planets`, `cars`, `christmas`, `halloween` or `anime` |
| `data-picture` | `data-picture="12"` | Open one picture straight away |
| `data-sound` | `data-sound="off"` | Start with sound off |

The pictures were made from Noto Color Emoji (Apache 2.0 license), plus our own drawings for the planets and the anime characters. `pixelart-demo.html` in this folder is a demo page.

# Embed code: Spider Climb Racing

A racing game for kids. You race 3 computer drivers around one of 20 tracks. The tracks come in five themes: meadow, desert, snow, city at night and beach. Later tracks are longer and twistier.

- **Setup:** pick a track, then a vehicle, then a driver.
  - Vehicles come in three groups. Cars: Sports Car, Hatchback, Muscle Car and Rally Car. Vans: Minivan, Delivery Van and Camper Van. Trucks: Pickup Truck, Monster Truck and Big Rig.
  - Each vehicle has bars for speed, power, handling and off-road, plus a choice of 9 paint colors.
  - There are 8 drivers: Max, Lily, Ravi, Sofia, Kenji, Amara, Leo and Zoe. You also choose the number of laps (1, 3 or 5) and how good the other racers are (Easy, Normal or Hard).
- **Views:** switch any time between bird's eye (from above) and driver view (from the driver's seat, with the steering wheel).
- **Racing:** a 3-2-1 countdown starts the race. During the race you see your place, lap, time, speed, nitro and a small map. Driving off the road slows you down, but less in the Rally Car and the Monster Truck. The other racers drive the same type of vehicle as you.
- **Finish:** a results table shows every driver's place and time. Your best time and best place on each track are saved in the browser, and medals show on the track cards.
- **Phones and tablets:** on-screen buttons appear for steering, gas, brake, nitro and drift. There is also a full screen button.

| Key | What it does |
| --- | --- |
| ↑ / ↓ | Gas / brake, and reverse when stopped (W and S also work) |
| ← / → | Steer (A and D also work) |
| Space | Drift around corners |
| Ctrl | Nitro boost (Shift also works) |
| V | Switch between bird's eye and driver view |
| P or Esc | Pause |
| R | Put the car back on the track |
| M | Sound on or off |

On a Mac, Ctrl with the arrow keys may switch desktops. If that happens, use Shift for nitro.

Paste this where the game should appear:

```html
<div data-spiderclimbs-racing></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/racing.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-track` | `data-track="7"` | Pick a track (1–20) first |
| `data-laps` | `data-laps="5"` | Laps per race: 1, 3 (default) or 5 |
| `data-view` | `data-view="driver"` | Start races in driver view |
| `data-sound` | `data-sound="off"` | Start with sound off |

The styles all start with `scr`, so they won't clash with your site's CSS. `racing-demo.html` in this folder is a demo page.

# Embed code: games box (Typing, Flash Cards, Pixel Art, Racing)

One embed code that shows four games in tabs: Spider Climb Typing, Math Flash Cards, Pixel Art by Number and Spider Climb Racing. A game's script loads only when its tab is first opened, so the page stays quick. Switching away from Racing pauses the race.

Paste this where the box should appear:

```html
<div data-spiderclimbs-games></div>
<script src="https://cdn.jsdelivr.net/gh/avgogames/embedcode@main/games.js" defer></script>
```

| Attribute | Example | What it does |
| --- | --- | --- |
| `data-tab` | `data-tab="racing"` | Tab to open first: `typing`, `flashcards`, `pixelart` or `racing` |
| `data-tabs` | `data-tabs="pixelart,racing"` | Which tabs to show, in order |
| `data-sound` | `data-sound="off"` | Start every game with sound off |
| `data-base` | `data-base="https://example.com/embed/"` | Load the game scripts from your own server |

The styles all start with `sgt`. `games-demo.html` in this folder is a demo page.

# About this repo

This repo holds the embed scripts (obfuscated) and the files they use:

- `pages/` and `set-2/`: the coloring pages (PNG, SVG, PDF).
- `math exercise/grade-N/`: the worksheet and answer-key PDFs.

The plain, readable scripts and the tools that build them are kept in the avgogames/spiderclimbs repo, under `embed/src/`, `embed/obfuscate/` and `embed/pixelart-source/`. After changing a script there, build the obfuscated file and copy it here.
