# Needs further modularization
SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f $SOURCE_DIR/.local_bashrc ]; then
    . $SOURCE_DIR/.local_bashrc
fi

# It's a prompt!

if [ "$color_prompt" ]; then
    alias ls='ls --color=auto'

    usr_c="\033[1;32m"
    dir_c="\033[1;34m"
    git_c="\033[1;30m"
    no_c="\033[00m"
fi

unset color_prompt

function git_root () {
    git rev-parse --show-toplevel 2>/dev/null
}
function git_branch () {
    git symbolic-ref --short HEAD 2>/dev/null
}
function show_user_host () {
    hostname=$(hostname | sed -r "s/\.local$//")
    user_host="$(whoami)@$hostname"
    if [[ $user_host == "george@georgematter.me" ]]; then
        user_host="george.m@tter.vi"
    fi
    echo -n "$user_host"
}
function show_location () {
    if [ -z "$(git branch 2> /dev/null)" ]; then
        echo -n "$(show_user_host)"
    else
        echo -n "$(basename $(git_root))"
    fi
}
function show_branch () {
    if [ -n "$(git branch 2> /dev/null)" ]; then
        echo -n ":$(git_branch)"
    fi
}
function show_rel_dir () {
    if [ -z "$(git branch 2> /dev/null)" ]; then
        echo -n $(pwd -L | sed -r "s|$HOME|~|")
    else
        echo -n $(git rev-parse --show-prefix | sed -r "s|^$|.|" | sed -r "s|/$||")
    fi
}

PS1='\r\r['
PS1=$PS1'\['$usr_c'\]$(show_location)\['$no_c'\]'
PS1=$PS1'\['$git_c'\]$(show_branch)\['$no_c'\] '
PS1=$PS1'\['$dir_c'\]$(show_rel_dir)\['$no_c'\]]$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(thefuck --alias)

