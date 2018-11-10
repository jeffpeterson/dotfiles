
color_stack=()
cur_color=39

c() {
	code="$1"

	if [ ! -z $code ]; then
		color_stack[${#array0[*]}]="$cur_color"
		cur_color=$code
	fi

	wrapped "$1" "${@:2}" 39
}
