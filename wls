#!/bin/sh

for win in $(lsw $@); do
	echo -ne "$win\t$(xtitle $win)\n"
done
