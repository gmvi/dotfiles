if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.inputrc ]; then . ~/.inputrc; fi

# Source Socrata configuration
source /Users/george.matter/.socratarc
unset DOCKER_HOST
export DEV_DIR=~/Socrata
export PAGER=less

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
