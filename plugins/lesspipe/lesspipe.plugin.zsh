# to force re-installation of lesspipe, remove directory `bin' and `share'
function lesspipe_install {
    local url=http://www-zeuthen.desy.de/~friebel/unix/less/lesspipe.tar.gz
    local filename=${url##*/}
    local cwd=$PWD
    cd "$ZSH/plugins/lesspipe"
    rm -rf "$filename" $ZSH/plugins/lesspipe/share $ZSH/plugins/lesspipe/bin
    wget "$url"
    tar zxf ${filename}
    rm -f "$filename"
    local dir=""
    for f in *; do
	if [ -d "$f" ] ;then
	    dir=$f
	    break
	fi
    done
    cd $dir
    ./configure --yes --prefix="$ZSH/plugins/lesspipe"
    mkdir -p $ZSH/plugins/lesspipe/share/man/man1
    make install
    rm -rf $ZSH/plugins/lesspipe/$dir
    cd $cwd
}

if [ ! -d $ZSH/plugins/lesspipe/bin ] ;then
    lesspipe_install
fi
export MANPATH="$ZSH/plugins/lesspipe/share/man:$MANPATH"
export LESS="$LESS -r"
eval `$ZSH/plugins/lesspipe/bin/lesspipe.sh`
