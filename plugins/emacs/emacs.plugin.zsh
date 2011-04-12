if ! type require_tool >/dev/null 2>&1 ; then
    cat <<EOF >/dev/stderr
Error: emacs plugin needs plugin require_tool.
Please enable it in your ~/.zshrc (and put it before emacs)
EOF
    read
    exit 1
fi

# Use daemon capabilities of emacs 23
if require_tool emacs 23 2>/dev/null ; then
    export EDITOR="$ZSH/plugins/emacs/emacsclient.sh"
    alias emacs="$EDITOR --no-wait"
    alias e=emacs
    # night is long
    alias emasc=emacs
    alias emcas=emacs
    # create a new X frame
    alias emacs_frame='emacsclient --alternate-editor "" --create-frame'
fi
