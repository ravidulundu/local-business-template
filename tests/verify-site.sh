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

assert_contains "$PUBLIC/roupa-de-santo/index.html" '<title>Roupa de Santo Sob Medida em Salvador | Ventos &amp; Aços</title>'
assert_contains "$PUBLIC/roupa-de-santo/index.html" '<h1>Roupa de Santo sob medida em Salvador</h1>'
assert_contains "$PUBLIC/saia-de-santo/index.html" '<title>Saia de Santo Sob Medida em Salvador | Ventos &amp; Aços</title>'
assert_contains "$PUBLIC/saia-de-santo/index.html" '<h1>Saia de Santo sob medida</h1>'
assert_contains "$PUBLIC/pano-da-costa/index.html" '<title>Pano da Costa em Salvador | Ventos &amp; Aços</title>'
assert_contains "$PUBLIC/pano-da-costa/index.html" '<h1>Pano da Costa em Salvador</h1>'

assert_contains "$PUBLIC/index.html" 'id="servicos"'
assert_contains "$PUBLIC/index.html" '>Peças e Serviços<'
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
    if len(blocks) != 3:
        raise SystemExit(f"FAIL: {path} should contain exactly 3 JSON-LD blocks")
    for block in blocks:
        json.loads(block)
print("JSON-LD valid")
PY

printf 'Site validation passed\n'
