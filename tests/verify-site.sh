#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
PUBLIC="$ROOT/public"
PHONE="5571981587532"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

assert_file() {
  [ -f "$1" ] || fail "missing file ${1#$ROOT/}"
}

assert_contains() {
  grep -Fq "$2" "$1" || fail "${1#$ROOT/} missing: $2"
}

for route in roupa-de-santo saia-de-santo pano-da-costa; do
  html="$PUBLIC/$route/index.html"
  markdown="$PUBLIC/$route/index.md"
  assert_file "$html"
  assert_file "$markdown"
  assert_contains "$html" "https://ventoseacos.com.br/$route/"
  assert_contains "$html" 'property="og:title"'
  assert_contains "$html" 'name="twitter:card"'
  assert_contains "$html" '"@type":"LocalBusiness"'
  assert_contains "$html" '"@type":"Service"'
  assert_contains "$html" '"@type":"FAQPage"'
  assert_contains "$html" "https://wa.me/$PHONE"
  assert_contains "$html" 'aria-label="Breadcrumb"'
  assert_contains "$html" 'class="back-to-top"'
  assert_contains "$html" 'src="/site.js"'
  assert_contains "$html" 'class="service-gallery"'
  assert_contains "$html" 'class="footer-contact"'
  assert_contains "$html" '<svg aria-hidden="true"'
  if grep -Fq '>Instagram</a>' "$html"; then
    fail "${html#$ROOT/} must use the Instagram icon, not text inside the circular button"
  fi
  lazy_count=$(grep -o 'loading="lazy"' "$html" | wc -l | tr -d ' ')
  [ "$lazy_count" -ge 3 ] || fail "${html#$ROOT/} needs at least 3 lazy-loaded content images"
  for href in / /roupa-de-santo/ /saia-de-santo/ /pano-da-costa/; do
    assert_contains "$html" "href=\"$href\""
  done
done

assert_contains "$PUBLIC/roupa-de-santo/index.html" '/assets/responsive/costureira-trabalhando-768.webp'
assert_contains "$PUBLIC/roupa-de-santo/index.html" '/assets/responsive/conjunto-vermelho-branco-640.webp'
assert_contains "$PUBLIC/roupa-de-santo/index.html" '/assets/responsive/detalhe-renda-640.webp'
assert_contains "$PUBLIC/saia-de-santo/index.html" '/assets/detalhe-renda-branca.webp'
assert_contains "$PUBLIC/saia-de-santo/index.html" '/assets/peca-branca-dourada.webp'
assert_contains "$PUBLIC/saia-de-santo/index.html" '/assets/responsive/tecidos-premium-768.webp'
assert_contains "$PUBLIC/pano-da-costa/index.html" '/assets/responsive/fios-contas-guias-640.webp'
assert_contains "$PUBLIC/pano-da-costa/index.html" '/assets/responsive/detalhe-bordado-ouro-640.webp'
assert_contains "$PUBLIC/pano-da-costa/index.html" '/assets/atelier-costura.webp'

assert_contains "$PUBLIC/index.html" 'class="back-to-top"'
assert_contains "$PUBLIC/index.html" 'src="/site.js"'
assert_file "$PUBLIC/site.js"
assert_contains "$PUBLIC/site.js" 'IntersectionObserver'
assert_contains "$PUBLIC/site.js" 'document.querySelector(".site-footer")'
assert_contains "$PUBLIC/site.js" 'backToTop.classList.toggle("is-visible"'
assert_contains "$PUBLIC/style.css" 'grid-template-columns: minmax(0, 1.45fr) minmax(320px, .85fr)'
assert_contains "$PUBLIC/style.css" '.service-gallery figure:first-child { grid-row: 1 / span 2; }'
assert_contains "$PUBLIC/style.css" '.footer-brand img { width: 100%; height: 100%; object-fit: contain; }'
assert_contains "$PUBLIC/style.css" '.brand img { width: 100%; height: 100%; object-fit: contain; }'
[ ! -e "$PUBLIC/assets/logo-footer.svg" ] || fail "footer-specific logo asset must not exist"
if grep -Fq '.footer-brand img { position: absolute' "$PUBLIC/style.css"; then
  fail "footer logo must not use absolute oversized cropping"
fi
if grep -R -Fq 'logo-footer.svg' "$PUBLIC"; then
  fail "header and footer must use the same logo.svg"
fi
for page in "$PUBLIC/index.html" "$PUBLIC/roupa-de-santo/index.html" "$PUBLIC/saia-de-santo/index.html" "$PUBLIC/pano-da-costa/index.html"; do
  logo_count=$(grep -o 'src="/assets/logo.svg"' "$page" | wc -l | tr -d ' ')
  [ "$logo_count" -ge 2 ] || fail "${page#$ROOT/} must use logo.svg in header and footer"
done

for page in "$PUBLIC/roupa-de-santo/index.html" "$PUBLIC/saia-de-santo/index.html" "$PUBLIC/pano-da-costa/index.html"; do
  assert_contains "$page" 'class="editorial-note"'
  assert_contains "$page" 'class="answer-block"'
  assert_contains "$page" '"@type":"Organization"'
  assert_contains "$page" '"@type":"WebSite"'
  assert_contains "$page" '"@type":"WebPage"'
  assert_contains "$page" '"@type":"BreadcrumbList"'
done
assert_contains "$PUBLIC/index.html" 'class="editorial-note"'
assert_contains "$PUBLIC/index.html" '"@type":"Organization"'
assert_contains "$PUBLIC/index.html" '"@type":"WebSite"'
assert_contains "$PUBLIC/index.html" '"@type":"WebPage"'

assert_contains "$PUBLIC/roupa-de-santo/index.html" '<title>Roupa de Santo Sob Medida em Salvador | Ventos &amp; Aços</title>'
assert_contains "$PUBLIC/roupa-de-santo/index.html" '<h1>Roupa de Santo sob medida em Salvador</h1>'
assert_contains "$PUBLIC/saia-de-santo/index.html" '<title>Saia de Santo Sob Medida em Salvador | Ventos &amp; Aços</title>'
assert_contains "$PUBLIC/saia-de-santo/index.html" '<h1>Saia de Santo sob medida</h1>'
assert_contains "$PUBLIC/pano-da-costa/index.html" '<title>Pano da Costa em Salvador | Ventos &amp; Aços</title>'
assert_contains "$PUBLIC/pano-da-costa/index.html" '<h1>Pano da Costa em Salvador</h1>'

assert_contains "$PUBLIC/index.html" 'id="servicos"'
assert_contains "$PUBLIC/index.html" '>Peças e Serviços<'
assert_contains "$ROOT/nginx.conf" 'Strict-Transport-Security'
assert_contains "$ROOT/nginx.conf" 'Content-Security-Policy'
assert_contains "$ROOT/nginx.conf" 'X-Content-Type-Options'
assert_contains "$ROOT/nginx.conf" 'X-Frame-Options'
assert_contains "$ROOT/nginx.conf" 'Referrer-Policy'
for route in roupa-de-santo saia-de-santo pano-da-costa; do
  assert_contains "$PUBLIC/index.html" "href=\"/$route/\""
  assert_contains "$PUBLIC/sitemap.xml" "https://ventoseacos.com.br/$route/"
  assert_contains "$ROOT/nginx.conf" "$route"
done

if grep -R -E '557191421460|9142-1460' "$PUBLIC" >/dev/null; then
  fail "obsolete incorrect phone number found"
fi

python3 - "$PUBLIC" <<'PY'
import json
import pathlib
import re
import sys

root = pathlib.Path(sys.argv[1])
for path in root.glob("*/index.html"):
    text = path.read_text(encoding="utf-8")
    blocks = re.findall(r'<script type="application/ld\+json">\s*(.*?)\s*</script>', text, re.S)
    if len(blocks) < 3:
        raise SystemExit(f"FAIL: {path} should contain at least 3 JSON-LD blocks")
    for block in blocks:
        json.loads(block)
print("JSON-LD valid")
PY

/home/dulunduz/.codex/skills/seo/.venv/bin/python - "$PUBLIC" <<'PY'
from bs4 import BeautifulSoup
from pathlib import Path
import sys

root = Path(sys.argv[1])
for path in (root / "roupa-de-santo" / "index.html", root / "saia-de-santo" / "index.html", root / "pano-da-costa" / "index.html"):
    soup = BeautifulSoup(path.read_text(encoding="utf-8"), "html.parser")
    words = len(" ".join(soup.find("main").stripped_strings).split())
    if words < 600:
        raise SystemExit(f"FAIL: {path.relative_to(root.parent)} has {words} main-content words; expected at least 600")
print("Service content depth valid")
PY

/home/dulunduz/.codex/skills/seo/.venv/bin/python - "$PUBLIC" <<'PY'
from bs4 import BeautifulSoup
from pathlib import Path
import sys

root = Path(sys.argv[1])
for path in (root / "index.html", root / "roupa-de-santo" / "index.html", root / "saia-de-santo" / "index.html", root / "pano-da-costa" / "index.html"):
    soup = BeautifulSoup(path.read_text(encoding="utf-8"), "html.parser")
    description = soup.find("meta", attrs={"name": "description"})["content"]
    if not 140 <= len(description) <= 160:
        raise SystemExit(f"FAIL: {path.relative_to(root)} meta description is {len(description)} chars; expected 140-160")
print("Meta descriptions valid")
PY

printf 'Site validation passed\n'
