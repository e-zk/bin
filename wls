#!/bin/sh
# 

for win in $(lswin $@); do
	echo -ne "$win\t$(xtitle $win)\n"
done
