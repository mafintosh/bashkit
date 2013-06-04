if complete &>/dev/null; then
	_bashkit_completion () {
		COMPREPLY=($(COMP_CWORD="$COMP_CWORD" COMP_PREV="${COMP_WORDS[$COMP_CWORD-1]}" COMP_CUR=${COMP_WORDS[$COMP_CWORD]} $1 ${COMP_WORDS[1]} --autocomplete 2> /dev/null )) || return $?
	}
	for app in $(bashkit list); do
		complete -o default -F _bashkit_completion $app
	done
	complete -o default -F _bashkit_completion bashkit

	BASHKIT_PATH=$(bashkit path)
	bashkit () {
		$BASHKIT_PATH "$@" || return $?
		[ "$1" = "link" ] || [ "$1" = "install" ] && . $(bashkit rc)
		return 0
	}
fi
