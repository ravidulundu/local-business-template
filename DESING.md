---
name: Ventos & Aços
colors:
  surface: '#171306'
  surface-dim: '#171306'
  surface-bright: '#3e3929'
  surface-container-lowest: '#120e03'
  surface-container-low: '#201b0d'
  surface-container: '#241f11'
  surface-container-high: '#2e2a1b'
  surface-container-highest: '#3a3425'
  on-surface: '#ece2cb'
  on-surface-variant: '#cfc5bd'
  inverse-surface: '#ece2cb'
  inverse-on-surface: '#353021'
  outline: '#988f88'
  outline-variant: '#4c4640'
  surface-tint: '#cdc5bf'
  primary: '#cdc5bf'
  on-primary: '#34302c'
  primary-container: '#0e0b08'
  on-primary-container: '#7f7974'
  inverse-primary: '#635d59'
  secondary: '#ecc246'
  on-secondary: '#3d2e00'
  secondary-container: '#b18c09'
  on-secondary-container: '#352800'
  tertiary: '#ffb3ad'
  on-tertiary: '#68010a'
  tertiary-container: '#220001'
  on-tertiary-container: '#ce504a'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e9e1db'
  primary-fixed-dim: '#cdc5bf'
  on-primary-fixed: '#1e1b17'
  on-primary-fixed-variant: '#4b4642'
  secondary-fixed: '#ffe08e'
  secondary-fixed-dim: '#ecc246'
  on-secondary-fixed: '#241a00'
  on-secondary-fixed-variant: '#584400'
  tertiary-fixed: '#ffdad6'
  tertiary-fixed-dim: '#ffb3ad'
  on-tertiary-fixed: '#410003'
  on-tertiary-fixed-variant: '#881d1d'
  background: '#171306'
  on-background: '#ece2cb'
  surface-variant: '#3a3425'
typography:
  display-lg:
    fontFamily: Playfair Display
    fontSize: 84px
    fontWeight: '700'
    lineHeight: 96px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Playfair Display
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
  headline-xl:
    fontFamily: Playfair Display
    fontSize: 48px
    fontWeight: '600'
    lineHeight: 60px
  headline-xl-mobile:
    fontFamily: Playfair Display
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
  headline-md:
    fontFamily: Playfair Display
    fontSize: 32px
    fontWeight: '500'
    lineHeight: 42px
  body-lg:
    fontFamily: Montserrat
    fontSize: 18px
    fontWeight: '300'
    lineHeight: 32px
    letterSpacing: 0.01em
  body-md:
    fontFamily: Montserrat
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 28px
  label-caps:
    fontFamily: Montserrat
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.2em
  button:
    fontFamily: Montserrat
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.1em
spacing:
  unit: 8px
  container-max: 1440px
  gutter: 24px
  margin-mobile: 20px
  margin-desktop: 80px
  section-gap: 160px
---

## Brand & Style
The design system embodies the intersection of ancestral spirituality and contemporary high fashion. It is designed to evoke a sense of "Sacred Luxury"—where the movement of the wind (Iansã) meets the structural precision of forged metal (Ogum). 

The visual style is **Minimalist Luxury** with an **Editorial** soul. It prioritizes silence and space to allow the craftsmanship of the clothing to speak. The emotional response should be one of profound respect, cultural pride, and exclusivity. Every interaction should feel intentional, smooth, and weighted with significance, mimicking the experience of a private atelier.

## Colors
The palette is rooted in deep, earthy obsidian and metallic brilliance. 

- **Primary Background (#0E0B08):** A "near-black" that provides a more organic, premium depth than pure black.
- **Accents & Action (#C9A227):** Gold is used sparingly for primary actions, fine borders, and iconography to denote value and spiritual light.
- **Contrast & Softness (#F3E9D2):** Ivory serves as a secondary surface color for cards or section blocks to prevent visual fatigue and add a tactile, fabric-like quality.
- **Energy (#8B1F1F):** A deep, blood-red used only for high-impact moments—notifications, special collection labels, or active states—representing the vitality of the Orixás.

## Typography
The typography strategy relies on a high-contrast serif for narrative and a clean, spacious sans-serif for utility.

- **Playfair Display** is the voice of the brand. It should be used for large headings, quotes, and editorial introductions. It represents the "Ventos" (winds)—fluid and expressive.
- **Montserrat** acts as the "Aços" (steel)—structured, modern, and reliable. Body text should use a lighter weight (300) with generous line height to maintain an airy, premium feel.
- **Letter Spacing:** Increase tracking on all caps labels and buttons to 10-20% to reinforce the luxury fashion aesthetic.

## Layout & Spacing
This design system utilizes a **Fixed Grid** philosophy for desktop to ensure a curated, museum-like presentation of content. 

- **Grid:** A 12-column grid with wide 80px margins on desktop. 
- **Whitespace:** Use "aggressive" vertical padding. Sections should be separated by a minimum of 120px to 160px to create a sense of calm and importance.
- **Asymmetry:** Occasionally break the grid with images that bleed to one edge of the screen or typography that overlaps image containers to mimic high-end fashion magazines.
- **Mobile:** Transition to a 4-column grid with 20px margins, maintaining high vertical spacing between elements to preserve the "breathable" quality.

## Elevation & Depth
In this system, depth is communicated through **Tonal Layers** and **Fine Outlines** rather than heavy shadows.

- **Surface Tiers:** The base is `#0E0B08`. Secondary containers use a subtle gradient of `#1A1612` or the Ivory `#F3E9D2` for high-contrast callouts.
- **Lines:** Use 0.5px to 1px solid lines in Gold (`#C9A227`) or Dark Bronze (`#2B1F15`) to define sections and borders. These "needle-thin" lines evoke high-fashion stitching.
- **Backdrop:** Use subtle background blurs (10px - 20px) on navigation bars to allow the cinematic photography to felt through as the user scrolls, creating a sense of layering without bulk.

## Shapes
The shape language is **Sharp (0)**. 

To reflect the strength of "Aços" (Ogum's steel) and the precision of high-tailoring, all buttons, input fields, and image containers use 90-degree angles. This severity creates a sophisticated, architectural silhouette. 

The only exception to this rule is the use of circular decorative elements or specific "spirit-inspired" iconography, which provide the "Ventos" contrast to the rigid UI structure.

## Components

### Buttons
- **Primary:** Solid Gold (`#C9A227`) with Black text. No border. Sharp corners. Hover state: Slight expansion or color shift to a brighter gold.
- **Secondary:** Ghost style. Transparent background with a 1px Gold or White border. Text in All-caps Montserrat.
- **Tertiary/Text:** Underlined text. The underline should be 1px and offset by 4px.

### Cards
- **Product Cards:** Minimalist. Image occupies 100% of the card area. Text (Title and Price) sits below the image in a centered, editorial alignment. No borders or shadows on the container itself; the image provides the structure.

### Input Fields
- **Style:** Bottom-border only (1px Dark Bronze). Label sits above in small-caps Montserrat. On focus, the border transitions to Gold.

### Navigation
- **Header:** Transparent by default, becoming semi-opaque Black on scroll. Center-aligned logo with navigation links spaced widely (40px+) using `label-caps` typography.

### Chips/Tags
- Small, rectangular boxes with 1px borders. Used for "New Collection" or "Limited Edition." Use the Accent Red (`#8B1F1F`) sparingly here for high-priority status.

### Imagery
- **Cinematic Photography:** All images should feature high-contrast lighting, deep shadows, and professional color grading. Images are the primary "component" of the UI.