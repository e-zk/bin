#!/bin/sh
# 
# e-zk (c) wtfpl 2020-2021
# perform integer factorization on some integer
# based on the algorithm described here:
# https://people.revoledu.com/kardi/tutorial/BasicMath/Prime/Algorithm-PrimeFactor.html

usage() {
	cat <<EOF
$(basename "$0"): perform integer factorization
usage: $(basename "$0") [integer] [sep]
where:
  integer    is the integer to decompose
  sep        is the (optional) separator between prime factors
             (" * " by default)
EOF
}

[ $# -lt 1 ] && usage && exit 1

N=$1
sep="${2:- * }"

p=2
while [ "$N" -ge $((p * p)) ]; do
	if [ $((N % p)) -eq 0 ]; then
		printf "%d%s" $p "$sep"
		N=$((N / p))
	else
		p=$((p + 1))
	fi
done
printf '%d\nEND\n' $N
