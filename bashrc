export PATH=$PATH:~/.bashkit/bin

if complete &>/dev/null; then
	_bashkit_completion () {
		COMPREPLY=($(COMP_CWORD="$COMP_CWORD" COMP_PREV="${COMP_WORDS[$COMP_CWORD-1]}" COMP_CUR=${COMP_WORDS[$COMP_CWORD]} $1 __autocomplete)) || return $?
	}
	_bashkit_completion_add () {
		complete -o default -F _bashkit_completion $1
	}
	for app in $(ls ~/.bashkit/bin); do
		_bashkit_completion_add $app
	done
fi