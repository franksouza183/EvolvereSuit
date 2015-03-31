#!/bin/bash
# apply-gnome-workaround.sh
#	Script for applying temporary workaround for EvolvereSuit icons
#	to appear correctly in GNOME desktop (issue #9)
#	
#	Expects the path to target iconset as argument.

function direct_args() {
    perl -e 'foreach($ARGV[0]..$ARGV[1]){printf("\"\${%i}\" ",$_);}' "${1}" "${2}"
}

function panic() {
	eval printf $(direct_args 2 "$#") 1>&2
	exit "$1"
}

function do_link() {
	local target="${1}"
	local name="${2}"
	
	if   [[ -L "./${name}" ]]; then
		# If link already exists
		printf 'remove:\t%s\n' "${name}"
		rm "./${name}"
	elif [[ -d "./${name}" ]]; then
		printf 'remove:\t%s\n' "${name}"
		rm -r "./${name}"
	elif [[ ! -e "./${name}" ]]; then
		# Do not create a link, if name does not exist. 
		printf 'miss:\t%s\n' "${name}"
		continue
	else
		# Panic, if it is a file or something not expected
		panic 2 'panic: unexpected behavior: %s is not either a link or dir or nothing\n' "${PWD}/${name}"
	fi
	
	printf 'link:\t%s -> %s\n' "${target}" "${name}"
	ln -s -T "${target}" "${name}"
	
	return 0
}

[[ -z "${1}" ]] && panic 1 'panic: path to iconset expected as argument\n'

while [[ -n "${1}" ]]; do
	pushd "$1" >/dev/null && panic $? 'panic: can not cd to %s\n' "${1}";
	
	for opdir in places mimetypes devices status categories apps actions; do
		pushd "${opdir}" >/dev/null
		
		printf '%s:\n' "${PWD}"
		for size in 32 48 128 256; do
			do_link "64" "${size}"
		done
		
		popd >/dev/null
	done
	
	popd >/dev/null
	
	shift
done

exit 0
