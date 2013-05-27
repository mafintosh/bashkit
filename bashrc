export PATH=$PATH:~/.bashkit/bin
export BASHKIT_INSTALL=~/.bashkit

if complete &>/dev/null; then
	_bashkit_completion () {
		COMPREPLY=($(COMP_CWORD="$COMP_CWORD" COMP_PREV="${COMP_WORDS[$COMP_CWORD-1]}" COMP_CUR=${COMP_WORDS[$COMP_CWORD]} $1 ${COMP_WORDS[1]} --autocomplete )) || return $?
	}
	_bashkit_completion_add () {
		echo completion for $1
		complete -o default -F _bashkit_completion $1
	}
	for app in $(ls $BASHKIT_INSTALL/bin); do
		_bashkit_completion_add $app
	done
fi