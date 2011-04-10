if type emacs >/dev/null 2>&1 ; then
    if emacs --version | grep -q "^GNU Emacs 23" ;then
	export EDITOR="$ZSH/plugins/emacs/emacsclient.sh"
	alias emacs="$EDITOR --no-wait"
	alias e=emacs
	alias emacs_frame='emacsclient --alternate-editor "" --create-frame'
    fi
fi
