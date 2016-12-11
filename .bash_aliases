alias lh='ls -dF `ls -A1|grep "^\."|tr "\n" " "`'
alias llh='ls -dlF `ls -A1|grep "^\."|tr "\n" " "`'
alias lllh='(echo llh `pwd` "| less"; ls --color=always -dlF `ls -A1|grep "^\."|tr "\n" " "`)|less -R'
alias lll='(echo ll `pwd` "| less"; ll --color=always)|less -R'

function cdls () {
  if [ $# -eq 0 ]
    then
      l
    else
      cd "$@" && l
  fi
}
alias c='cdls'

alias treee='tree -C | less -XFR'

exit() {
  if [[ -z $TMUX ]]; then
    builtin exit
  else
    tmux detach
  fi
}

alias git=hub
alias vim=nvim
if hash gls 2>/dev/null; then alias ls=gls; fi
function faketty { script -qfc "$(printf "%q " "$@")"; }
