#!/bin/sh

x=`emacsclient -a '' -e '(x-display-list)' 2>/dev/null`
if [ -z "$x" ] ;then
    emacsclient --alternate-editor "" --create-frame $@
else
    emacsclient --alternate-editor "" $@
fi
