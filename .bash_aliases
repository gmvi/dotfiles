alias lh='ls -dF `ls -A1|grep "^\."|tr "\n" " "`'
alias llh='ls -dlF `ls -A1|grep "^\."|tr "\n" " "`'
alias lllh='(echo llh `pwd` "| less"; ls --color=always -dlF `ls -A1|grep "^\."|tr "\n" " "`)|less -R'
alias lll='(echo ll `pwd` "| less"; ll --color=always)|less -R'
function cl () {
  if [ $# -eq 0 ]
    then
      l
    else
      cd "$@" && l
  fi
}
alias copy='xclip -selection clipboard -i'
