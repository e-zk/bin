#!/bin/sh

for win in $(lsw $@); do
	echo -ne "$win $(xtitle $win)\n"
done
