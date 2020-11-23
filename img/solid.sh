#!/bin/sh
# make a pretty image
#set -ex

# default options
OUTPUT="out.png"
DIMENS="1920x1080"
SCALE='100%'
FAIL=0

# usage
usage() {
        cat<<EOF
usage: $(basename $0) -i IMAGE -c COLOR [-s SCALE] [-d DIMENS] [-o OUTPUT]
where:
    IMAGE     path to the input image
    COLOR     color in #rgb or #rrggbb format
    SCALE     input image scale/max-width (default: 100%)
    DIMENS    output image dimentions {width}x{height} (default: 1920x1080)
    OUTPUT    path to output image (default: out.png)

note: only \`-i' and \`-c' are required. other flags are optional and fall back to defaults.
EOF
}

# options check
check_opts() {
	test -z "$IMAGE" && FAIL=1
	test -z "$COLOR" && FAIL=1
	echo "$DIMENS" | grep -Ex '[0-9]+x[0-9]+' || FAIL=1
}

while getopts c:d:hi:o:s: opt; do
	case $opt in 
		c)	COLOR="$OPTARG" ;;
		d)	DIMENS="$OPTARG" ;;
		h)	usage
			exit 0 ;;
		i)	IMAGE="$OPTARG" ;;
		o)	OUTPUT="$OPTARG" ;;
		s)	SCALE="$OPTARG" ;;
		*)	usage 
			exit 1 ;;
	esac
done

if [ $FAIL -eq 1 ]; then
	usage
	exit 1
fi

# temps
TMP="$(mktemp -d)"
TMPFILE="${TMP}/tmp1.$(basename $OUTPUT)"
TMPFILE2="${TMP}/tmp2.$(basename $OUTPUT)"

test -f "$TMPFILE" && rm -f "$TMPFILE"
test -f "$TMPFILE2" && rm -f "$TMPFILE2"

# Create a solid color image double the size of the original
convert -size $DIMENS xc:${COLOR} "$TMPFILE"
# Place the given image in the center of the solid color image
convert "$IMAGE" -resize "${SCALE}" "$TMPFILE2"
convert "$TMPFILE" "$TMPFILE2" -gravity center -composite "$OUTPUT"

# Remove the temp file
rm "$TMPFILE"
rm "$TMPFILE2"

