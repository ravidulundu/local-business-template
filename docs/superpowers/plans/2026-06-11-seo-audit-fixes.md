# SEO Audit Fixes Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Resolve the prioritized findings from the June 11, 2026 Codex SEO audit without changing the static architecture or visual identity.

**Architecture:** Apply improvements in isolated, testable batches: content and trust signals, metadata and structured data, Nginx headers and sitemap cleanup, image optimization, then mobile UX verification. Preserve the user-provided `logo.svg` and use it in both header and footer.

**Tech Stack:** Static HTML5, CSS3, JSON-LD, Nginx, WebP, Docker, shell tests, Playwright.

---

### Task 1: Content Depth And Trust

**Files:** `public/index.html`, three service `index.html` files, three service `index.md` files, `public/style.css`, `tests/verify-site.sh`

- [ ] Require at least 600 visible words on each service page.
- [ ] Add self-contained answer sections with question headings.
- [ ] Add visible Ventos & Aços editorial and updated-date attribution.
- [ ] Verify readability, page structure, and responsive rendering.

### Task 2: Metadata And Structured Data

**Files:** four HTML pages, `tests/verify-site.sh`

- [ ] Bring descriptions into the 140-160 character range.
- [ ] Add linked Organization, WebSite, WebPage, and BreadcrumbList JSON-LD.
- [ ] Correct service-specific Open Graph and Twitter metadata.
- [ ] Parse and validate every JSON-LD block.

### Task 3: Technical SEO

**Files:** `nginx.conf`, `public/sitemap.xml`, `tests/verify-site.sh`

- [ ] Add CSP, HSTS, frame, MIME, referrer, and permissions headers.
- [ ] Remove deprecated sitemap priority/changefreq fields.
- [ ] Validate Nginx and all canonical routes in Docker.

### Task 4: Image Optimization

**Files:** `public/assets/`, four HTML pages, `tests/verify-site.sh`

- [ ] Generate appropriately sized local responsive WebP variants.
- [ ] Keep hero images eager and all below-fold content images lazy.
- [ ] Confirm dimensions, alt text, and rendered quality.

### Task 5: Mobile UX And Final Audit

**Files:** `public/style.css`, `public/site.js`, `tests/verify-site.sh`

- [ ] Verify WhatsApp and back-to-top controls do not obscure content.
- [ ] Run desktop/mobile Playwright screenshots.
- [ ] Commit and deploy all fixes, then rerun the live SEO audit.
