
if ! [ -d "$ZSH/plugins/git-svn/git-svn-clone-externals" ] ;then
    git clone https://github.com/tristan0x/git-svn-clone-externals.git \
        "$ZSH/plugins/git-svn/git-svn-clone-externals"
fi
export PATH="$ZSH/plugins/git-svn/git-svn-clone-externals:$PATH"

function git_svn_update {
    (cd "$ZSH/plugins/git-svn/git-svn-clone-externals" && \
        git pull origin master)
}
