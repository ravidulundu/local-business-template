# Static SEO Service Pages Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert the one-page static site into a four-page SEO site without changing its framework-free deployment architecture.

**Architecture:** Add directory-index HTML and Markdown documents under `public/`, reuse the shared stylesheet and assets, and extend Nginx content negotiation for Markdown. Validate SEO, schema, links, phone data, and deployment with a shell test.

**Tech Stack:** HTML5, CSS3, vanilla JavaScript, JSON-LD, Markdown, Nginx Alpine, Docker Compose, shell validation.

---

### Task 1: Add failing site validation

**Files:**
- Create: `tests/verify-site.sh`

- [ ] Assert all requested HTML/Markdown routes, metadata, schemas, internal links, sitemap URLs, and verified phone values.
- [ ] Run `bash tests/verify-site.sh` and confirm it fails because service pages do not exist.

### Task 2: Add service pages and shared styles

**Files:**
- Create: `public/roupa-de-santo/index.html`
- Create: `public/saia-de-santo/index.html`
- Create: `public/pano-da-costa/index.html`
- Create: `public/roupa-de-santo/index.md`
- Create: `public/saia-de-santo/index.md`
- Create: `public/pano-da-costa/index.md`
- Modify: `public/style.css`

- [ ] Build all required page sections with local responsive images and accessible markup.
- [ ] Add canonical/social metadata and LocalBusiness, Service, and FAQPage JSON-LD.
- [ ] Add shared breadcrumb, service hero, cards, and cross-link styles.

### Task 3: Update homepage and static discovery

**Files:**
- Modify: `public/index.html`
- Modify: `public/index.md`
- Modify: `public/sitemap.xml`
- Modify: `nginx.conf`

- [ ] Replace global navigation with the requested links.
- [ ] Add the `Peças e Serviços` homepage section.
- [ ] Add all canonical routes to sitemap and Markdown alternatives to Nginx.

### Task 4: Verify delivery

**Files:**
- Test: `tests/verify-site.sh`

- [ ] Run the site validation script and inspect JSON-LD parsing.
- [ ] Validate Nginx configuration through the project Docker image.
- [ ] Start the Compose service and smoke-test HTML and Markdown responses when Docker is available.
- [ ] Review `git diff --check` and `git status --short`.
