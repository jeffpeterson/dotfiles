#!/usr/bin/env bash

show() {
	printf "\n$@\n\n"
}

error() {
	usage >&2

	if [[ ! -z "$1" ]]; then
		show "$(red "$1")" >&2
	fi

	exit 1
}

require() {
	[[ -z "${@:2}" ]] && error "Argument <$1> is required."
	eval "$1=\"${@:2}\""
}

run() {
	echo "$@"
	$@
}


wrapped() {
	require "start_code" $1
	require "str" $2
	require "end_code" $3

	printf "\e[${start_code}m${str}\e[${end_code}m"
}


color() {
	wrapped "$1" "${@:2}" 39
}

bold() {
	wrapped 1 "$@" 21
}

dim() {
	wrapped 2 "$@" 22
}

underline() {
	wrapped 4 "$@" 24
}

red() {
	color 31 "$@"
}

yellow() {
	color 33 "$@"
}

green() {
	color 32 "$@"
}

h1() {
	underline "$(green "$@")"
}

USAGE=""
NAME=""
n=$'\n'

usage_name() {
	require name $1
	NAME="$name"
}

usage_cmd() {
	require cmd $1
	require desc $(cat)

	USAGE+="      $NAME $(h1 "$cmd")$n"
	USAGE+="        $desc$n$n"
}

usage() {
	cat <<-END

	  Usage: $NAME <cmd> [flags]

	${USAGE}
	END
}
