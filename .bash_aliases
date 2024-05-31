# ls aliases
alias ll='ls -lAFh'
alias la='ls -AF'
alias l='ls -Ft'

function cdls () {
    [ ! $# -eq 0 ] && cd "$@"; l
}
alias c=cdls

# cd_up() takes the first portion of a path element and cds to that element.
# Prefers deeper-nested matches, and defaults to the parent directory.
function cd_up() {
    cwd=$(pwd)
    case $1 in
        /*)
            cd $1
            ;;
        *)
            cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )
            ;;
    esac
    # s/([^$])/\1/ is basically a negative lookahead like s/(?!$)//
    #pwd | sed "s|^$HOME\([^$]\)|~\1|"
    l
}
alias c.=cd_up

if [[ -z $TMUX ]]; then
    alias exit='tmux detach'

# function randint() {
#     if [ $# -eq 0 ]; then
#         MIN=0
#         MAX=65535
#     elif [ $# -eq 1 ]; then
#         MIN=0
#         MAX=$1
#     else
#         MIN=$1
#         MAX=$2
#     fi
#     if hash jot 2>/dev/null; then
#         jot -r 1 $MIN $MAX
#     fi
# }

# function pssh() {
#     PORT=$(jot -r 1 1025 65536)
#     if ssh -D $PORT -fqN "$@"; then
#         echo proxy listening on localhost:$PORT
#     fi
# }

# function faketty { script -qfc "$(printf "%q " "$@")"; }
# lias randman="until for binpath in ${PATH//:/$' '}; do ls ${binpath}; done | shuf | head -1 | xargs man; do :; done"
