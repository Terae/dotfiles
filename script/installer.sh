#!/bin/bash
home="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$home"/script/print.sh

install() {
	info "Installation of '$1'"
	sudo apt-get install "$1"
}

install_if_needed() {
	which "$1" > /dev/null
	if [ "$?" != 0 ]; then
		install "$1"
	fi
}


# Check if the function exists (bash specific)
#if declare -f "$1" > /dev/null; then
#	# Call argulents verbatim
#	"$@"
#else
#	fail "'$1' is not a known function name" >&2
#	exit 1
#fi

