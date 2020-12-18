#!/usr/bin/awk -f

# get longest line length
length > max_len { max_len = length } END { print max_len }
