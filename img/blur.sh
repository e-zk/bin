#!/bin/sh
# blur image/video

INPUT="$1"
SIGMA="$2"
STEPS="$3"
OUTPUT="$4"

ffmpeg -i "$INPUT" -filter_complex "gblur=sigma=${SIGMA}:steps=${STEPS}" "$OUTPUT"
