#!/usr/bin/env bash
# build-screenshots - Bake the App Store screenshots for Wavelength.
#
# On the App Store a screenshot is just the image rectangle; any caption has to
# be part of the PNG. So this drops each raw app screenshot (assets/raw/) into a
# real iPhone frame and bakes its caption in, using the shared ~/bin/frame-shot
# tool (the same framing the product page uses). Output overwrites assets/<name>.png,
# which app.json references as bare images (no separate caption text). Captions
# live here only, so edit them in one place and re-run.
#
# Usage: apps/wavelength/build-screenshots.sh
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
RAW="$DIR/assets/raw"
OUT="$DIR/assets"
BG="#0f0f0f"
FG="#e8e4de"

# raw file | caption (baked into the image)
SHOTS=(
  "jetlag|Land on local time. Wavelength tells you when to chase daylight and when to avoid it."
  "daytime|Your camera reads the light you’re in and whether it helps or hurts your sleep."
  "sleep|After sundown the app goes dark and confirms your room is dim enough to sleep."
  "shiftwork|Holding a new schedule or a night shift? It walks you through every step."
)

for spec in "${SHOTS[@]}"; do
  IFS='|' read -r name caption <<< "$spec"
  frame-shot "$RAW/$name.png" "$OUT/$name.png" --caption "$caption" --bg "$BG" --fg "$FG"
done
