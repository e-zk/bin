#!/bin/sh
# openbsd pkg shortcuts

usage() {
	cat <<-EOF
	$(basename $0) [a|add] [s|size] [d|del|delete] [i|info] [q|query|search] PKGNAME ...
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
	*)
		echo "unknown"
		usage
		exit 1
		;;
esac
