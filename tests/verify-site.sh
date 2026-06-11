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
  for href in / /roupa-de-santo/ /saia-de-santo/ /pano-da-costa/; do
    assert_contains "$html" "href=\"$href\""
  done
done

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
