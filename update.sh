#!/usr/bin/env bash
# Refresh the published Wheel dashboard from the latest local render + push to Pages.
set -e
SRC="$HOME/Documents/vol-monitor/charts/wheel"
SITE="$HOME/Documents/wheel-desk-site"
cp "$SRC/wheel.html" "$SITE/index.html"                 # stock board   → /
[ -f "$SRC/wheel_indices.html" ] && cp "$SRC/wheel_indices.html" "$SITE/indices.html"   # macro/ETF board → /indices.html
[ -f "$SRC/wheel_show_earnings.html" ] && cp "$SRC/wheel_show_earnings.html" "$SITE/show-earnings.html"
cd "$SITE"
git add -A
git commit -qm "refresh $(date +%Y-%m-%d)" || { echo "nothing changed"; exit 0; }
git push -q
echo "updated:"
echo "  stock → https://nightwolfix.github.io/wheel-desk-16d08c7e/"
echo "  ETF   → https://nightwolfix.github.io/wheel-desk-16d08c7e/indices.html   (Pages rebuilds in ~30-60s)"
