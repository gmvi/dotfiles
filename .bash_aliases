alias git=hub
alias vim=nvim
if hash gls 2>/dev/null; then alias ls=gls; fi
function faketty { script -qfc "$(printf "%q " "$@")"; }
alias tmux="tmux a"
