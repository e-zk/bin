#!/bin/sh
# openbsd pkg shortcuts

usage() {
	cat <<-EOF
	usage: $(basename $0) [a|d|i|q|s|h] PKGNAME ...
	where:
	    a|add     install package
	    d|delete  remove package
	    i|info    get package info
	    q|query   query/search for packages
	    s|size    get install size of package w/o installing
	    h|help    this help message
EOF
}

case "$1" in
	a|add)  shift
		pkg_add "$@"
		;;
	s|size) shift
		pkg_add -s "$@"
		;;
	q|query|search) shift
		pkg_info -Q "$@"
		;;
	d|del|delete) shift
		pkg_delete "$@"
		;;
	i|info) shift
		pkg_info "$@"
		;;
	h|help)
		usage
		exit 0
		;;
	*)
		printf "%s: unknown: %s\n" "$0" "$1"
		usage
		exit 1
		;;
esac
