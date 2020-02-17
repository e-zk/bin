#!/bin/sh
# invert an image/video

INPUT="$1"
OUTPUT="$2"

ffmpeg -i "$INPUT" -vf negate "$OUTPUT"
