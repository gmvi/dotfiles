function upgrade_if_exists () {
    if hash $2 2>/dev/null; then
        if alias=$(alias $1 2>/dev/null); then
            # extract right hand side of existing alias, then replace $1 with $2
            rhs=$(echo $alias | sed -r "s/^.*?'(.*)'$/\1/" | sed -r "s/^$1\b/$2/")
            alias $1="$rhs"
        else
            alias $1="$2"
        fi
    fi
}
upgrade_if_exists git hub
upgrade_if_exists vim nvim
upgrade_if_exists ls gls
upgrade_if_exists shuf gshuf

if ls --version 2>/dev/null | grep GNU >/dev/null; then
    # ls is gls
    alias ll='ls -lAFh --group'
    alias la='ls -AF --group'
    alias l='ls -Ft --group'
else
    alias ll='ls -lAFh'
    alias la='ls -AF'
    alias l='ls -Ft'
fi

alias t='tree -L 2'

function cdls () {
    if [ ! $# -eq 0 ]; then
        cd "$@"
    fi
    l
}
function cdtree () {
    if [ ! $# -eq 0 ]; then
        cd "$@"
    fi
    t
}
alias c=cdls

function cd_up() {
    cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )
    pwd | sed "s|^$HOME\([^$]\)|~\1|"
    l
}
alias c.=cd_up

if hash xclip 2>/dev/null; then
    alias clipboard='xclip -selection clipboard'
    alias copy='clipboard -i'
    alias paste='clipboard -o'
fi

alias treee='tree -C | less -XFR'

function randint() {
    if [ $# -eq 0 ]; then
        MIN=0
        MAX=65535
    elif [ $# -eq 1 ]; then
        MIN=0
        MAX=$1
    else
        MIN=$1
        MAX=$2
    fi
    if hash jot 2>/dev/null; then
        jot -r 1 $MIN $MAX
    fi
}

function pssh() {
    PORT=$(jot -r 1 1025 65536)
    if ssh -D $PORT -fqN "$@"; then
        echo proxy listening on localhost:$PORT
    fi
}

function exit() {
  if [[ -z $TMUX ]]; then
    builtin exit
  else
    tmux detach
  fi
}
function faketty { script -qfc "$(printf "%q " "$@")"; }
#alias randman="until for binpath in ${PATH//:/$' '}; do ls ${binpath}; done | shuf | head -1 | xargs man; do :; done"
