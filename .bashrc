if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# some more ls aliases
alias ls='ls -G'
alias ll='ls -lAFh'
alias la='ls -AF'
alias l='ls -F'

alias lh='ls -dF `ls -A1|grep "^\."|tr "\n" " "`'
alias llh='ls -dlF `ls -A1|grep "^\."|tr "\n" " "`'

function cdls () {
  if [ $# -eq 0 ]
    then
      l
    else
      cd "$@" && l
  fi
}
alias c=cdls

function cd_up() {
  cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )
  pwd | sed "s|^$HOME\([^$]\)|~\1|"
  l
}
alias c.=cd_up

function pbsed () {
  if sed_output=$(pbpaste | sed "$@"); then
    echo $sed_output | pbcopy
  fi
}

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    dir_c="\033[1;34m"
    git_c="\033[1;30m"
    no_c="\033[00m"
fi


function branch () {
    branch_name=`git symbolic-ref --short HEAD 2> /dev/null`
    if [ -n "$branch_name" ]; then
        echo -n ":"
    fi
    echo -n $branch_name
}

function show_user () {
    # if ! [ -e "${HOME}/.oncall" ]; then
    whoami
    # fi
}

function show_host () {
    if [ -z "$(git branch 2> /dev/null)" ] \
           && ! [ -e "${HOME}/.oncall" ]; then
        echo -n "@$(hostname -s)"
    fi
}

PS1=''                                               # start
PS1=$PS1'['                                          # open-bracket
PS1=$PS1'\['${usr_c}'\]$(show_user)\['${no_c}'\]'    # user
PS1=$PS1'$(show_host)'                               # host
PS1=$PS1' \['${dir_c}'\]\W\['${no_c}'\]'             # directory
PS1=$PS1'\['${git_c}'\]$(branch)\['${no_c}'\]'       # version control
PS1=$PS1']'                                          # close-bracket
PS1=$PS1'\$ '                                        # dollar

export NVM_DIR="/Users/george.matter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(thefuck --alias)"

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
