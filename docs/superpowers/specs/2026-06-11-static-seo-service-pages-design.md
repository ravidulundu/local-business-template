# Static SEO Service Pages Design

## Scope

Extend the existing framework-free static website with three SEO landing pages for roupa de santo, saia de santo, and pano da costa. Preserve the current visual system, responsive image approach, accessibility behavior, Docker image, Compose service, and Nginx static delivery.

## Architecture

Each service lives in its own directory under `public/` with an `index.html` and simplified `index.md`. All HTML pages use the existing `/style.css` and local assets. Nginx continues to serve directory indexes and gains explicit content negotiation for each service URL so `Accept: text/markdown` returns the matching Markdown document.

## Page Structure

Each service page includes the shared header/navigation and footer, breadcrumb navigation, a product hero, explanation, benefits, process, FAQ, CTA, and cross-links to all service pages and the homepage. The homepage gains a dedicated `Peças e Serviços` section and the same global navigation.

## SEO And Structured Data

Every service page has its requested title, description, canonical URL, Open Graph metadata, Twitter Card metadata, LocalBusiness JSON-LD, page-specific Service JSON-LD, and matching FAQPage JSON-LD. The XML sitemap lists all four canonical URLs. Robots remain permissive.

## Business Data

The site keeps the verified existing phone number `+55 71 98158-7532` and WhatsApp number `5571981587532`. Address, email, Instagram, and opening hours follow the supplied business details.

## Verification

A repository-local shell test validates routes, metadata, schema types, internal links, Markdown fallbacks, sitemap entries, phone consistency, and Docker/Nginx configuration. Nginx configuration and the built container are checked when Docker is available.
