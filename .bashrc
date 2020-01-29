color_prompt=1

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f $SOURCE_DIR/.local_bashrc ]; then
	. $SOURCE_DIR/.local_bashrc
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Bit messy prompt code

if [ "$color_prompt" ]; then
	alias ls='ls --color=auto'

	usr_c="38;5;171"
	dir_c="38;5;37"
	git_c="1;30"
	no_c="00"
fi

unset color_prompt

function print_git_root () {
	if git_dir="$(git rev-parse --git-dir 2>/dev/null)"; then
		dirname "$(realpath "$git_dir")"
	else
		return 1
	fi
}
function print_git_branch () {
	git symbolic-ref --short HEAD 2>/dev/null
}
function wrap () {
	# only iterperet the first arg as color code if it looks the part
	if grep -qE '([0-9]{1,3};)*[0-9]{1,3}' <<< $1; then
		echo -e "\e[$1m${@:2}\e[00m"
	else
		echo -n "$@"
	fi
}
function print_user_host () {
	user="$(whoami)"
	hostname="$(hostname | sed 's/\.local$//')"
	if [[ "$user" == "george" && "$hostname" == "georgematter.me" ]]; then
		wrap $usr_c 'george.m@tter.vi'
	else
		echo -n "$(wrap $usr_c $user)@$(wrap $usr_c $hostname)"
	fi
}
function print_location () {
	# if we're in a git dir, print git root's basename instead of user@host
	if git_root="$(print_git_root)"; then
		git_root="$(basename $git_root)"
		echo -n "$(wrap $usr_c $git_root):$(wrap $git_c $(print_git_branch))"
	else
		# print user@host unless it's overridden by .bash_local
		if [ ! -z "$user_host"]; then
			wrap $usr_c $user_host
		else
			user="$(whoami)"
			hostname="$(hostname | sed 's/\.local$//')"
			echo -n "$(wrap $usr_c $user)@$(wrap $usr_c $hostname)"
		fi
	fi
}
function print_rel_dir () {
	# using `|` instead of `/` for these regexes because paths
	if rel_path="$(git rev-parse --show-prefix 2>/dev/null)"; then
		wrap $dir_c $(sed 's|^$|.|; s|/$||' <<< $relpath)
	else
		wrap $dir_c $(pwd -L | sed "s|$HOME|~|")
	fi
}

export PS1='[$(print_location) $(print_rel_dir)]$ '

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(thefuck --alias)

