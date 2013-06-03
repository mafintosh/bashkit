export PATH=$PATH:~/.bashkit/bin
export BASHKIT_INSTALL=~/.bashkit

if complete &>/dev/null; then
	_bashkit_completion () {
		COMPREPLY=($(COMP_CWORD="$COMP_CWORD" COMP_PREV="${COMP_WORDS[$COMP_CWORD-1]}" COMP_CUR=${COMP_WORDS[$COMP_CWORD]} $1 ${COMP_WORDS[1]} --autocomplete 2> /dev/null )) || return $?
	}
	for app in $(ls $BASHKIT_INSTALL/bin); do
		complete -o default -F _bashkit_completion $app
	done
fi