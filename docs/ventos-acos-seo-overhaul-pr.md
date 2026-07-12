# Ventos & Aços SEO Overhaul

## Baseline audit from live site

- Live homepage returned HTTP 200, self-referencing canonical and indexable status.
- Technical score from the SEO script: 92/100. Main issues: identical sitemap lastmod values, unavailable real-user/PageSpeed field data, and no IndexNow.
- Schema score from the SEO script: 100/100 with warning. Existing `FAQPage` is valid JSON-LD, but Google restricts FAQ rich results mostly to government and health authority sites.
- Image score from the SEO script: 78/100. Main issue: several WebP images above the 200KB warning threshold.
- Live content issue found before edits: the order process mentioned delivery, and schema classified the business as `ClothingStore`, which conflicts with the atelier-only business model.

## Content and local SEO changes

- Repositioned Ventos & Aços as a custom tailoring atelier for Candomblé and Umbanda garments in Salvador, not a store, catalog, e-commerce, or ready-made clothing business.
- Removed the stale "Ajustes e Reformas" promise from markdown content and added explicit "does not do" copy for repairs, alterations, casual clothing, costumes, figurinos, and general tailoring.
- Standardized NAP sitewide:
  - Ventos & Aços
  - Rua Almirante Alves Câmara, 3, Apto 102, Engenho Velho de Brotas, Salvador - BA, CEP 40243-005
  - +55 71 98236-6745
- Standardized hours: seg-sex 09:00-17:30, sáb 09:00-13:00, domingo fechado.
- Added a local SEO section with appointment-only notice, exact address, WhatsApp, hours, pickup-only policy, and Google Maps embed.
- Rewrote homepage FAQ to cover prazo, medidas, orçamento, pickup-only, no delivery, no ready stock, no repairs, service scope, out-of-Salvador orders, and group orders for casas de axé.
- Kept cultural wording deferential: colors, models, and compositions defer to the customer's house or religious authority.

## Technical SEO changes

- Removed unnecessary hreflang tags for the pt-BR-only site.
- Updated LocalBusiness schema to remove `ClothingStore`, avoid price/payment fields, and align business description, services, NAP, and hours.
- Preserved BreadcrumbList schema on service pages.
- Added `public/404.html` and changed Nginx fallback to return real 404s instead of serving the homepage for unknown routes.
- Added `/llms.txt` with clear citable facts for AI search systems.
- Expanded robots.txt with AI search crawler allowances and sitemap reference.
- Updated sitemap lastmod values to 2026-07-12.
- Updated CSP to permit the Google Maps iframe while keeping restrictive defaults.
- Added `.seo-cache/` to `.gitignore`.

## Image and performance changes

- Recompressed large WebP assets:
  - `conjunto-branco-dourado.webp`: 262,564 -> 200,916 bytes
  - `conjunto-vermelho-branco.webp`: 225,554 -> 196,208 bytes
  - `detalhe-bordado-ouro.webp`: 239,958 -> 198,526 bytes
  - `peca-branca-dourada.webp`: 220,082 -> 197,760 bytes
  - `peca-vermelha.webp`: 226,640 -> 192,672 bytes
  - `tecidos-premium.webp`: 212,928 -> 187,558 bytes
- Kept width/height attributes, lazy loading for below-fold images, and high-priority hero image loading.

## Verification

- `sh tests/verify-site.sh`: passed.
- JSON-LD parse validation across HTML pages: passed.
- Local crawl against `http://127.0.0.1:8091/`: passed, 22 internal links checked.
- Docker/Nginx syntax: passed with `nginx -t`.
- Nginx local 404 check: unknown route returns HTTP 404.
- Lighthouse mobile against local Nginx:
  - Performance: 98
  - Accessibility: 96
  - Best Practices: 100
  - SEO: 100
  - LCP: 2.3s
  - CLS: 0.05
  - TBT: 0ms
- `seo-drift` baseline captured for live URL:
  - URL: `https://ventoseacos.com.br/`
  - Baseline ID: `1`
  - Timestamp: `2026-07-12T21:15:17.080893+00:00`

## Notes

- No deployment was performed.
- The drift baseline captures the current live site, not these local branch changes.
- FAQPage JSON-LD is kept because it was requested, but it should not be treated as a guaranteed Google FAQ rich result for this commercial site.
