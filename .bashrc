color_prompt=1

[ -f ~/.local_bashrc ] && source ~/.local_bashrc

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

[ -f ~/.dircolors ] && eval $(dircolors ~/.dircolors)

# Bit messy prompt code

if [ "$color_prompt" ]; then
	alias ls='ls --color=auto'

	usr_c="38;5;171"
	dir_c="38;5;111"
	git_c="38;5;102"
	no_c="00"
fi

unset color_prompt

function _print_git_root () {
	if git_dir="$(git rev-parse --git-dir 2>/dev/null)"; then
		dirname "$(realpath "$git_dir")"
	else
		return 1
	fi
}
function _print_git_branch () {
	git symbolic-ref --short HEAD 2>/dev/null
}
function _wrap () {
	# only iterperet the first arg as color code if it looks the part
	if grep -qE '([0-9]{1,3};)*[0-9]{1,3}' <<< $1; then
		echo -n "\[\e[$1m\]${@:2}\[\e[00m\]"
	else
		echo -n "$@"
	fi
}
function _print_user_host () {
	user="$(whoami)"
	hostname="$(hostname | sed 's/\.local$//')"
	if [[ "$user" == "george" && "$hostname" == "georgematter.me" ]]; then
		_wrap $usr_c 'george.m@tter.vi'
	else
		echo -n "$(_wrap $usr_c $user)@$(_wrap $usr_c $hostname)"
	fi
}
function _print_location () {
	# if we're in a git dir, print git root's basename instead of user@host
	if git_root="$(_print_git_root)"; then
		git_root="$(basename "$git_root")"
		git_branch="$(_print_git_branch)"
		echo -n "$(_wrap $usr_c $git_root):$(_wrap $git_c $git_branch)"
	else
		# print user@host unless it's overridden by .bash_local
		if [ ! -z "$user_host"]; then
			_wrap $usr_c $user_host
		else
			user="$(whoami)"
			hostname="$(hostname | sed 's/\.local$//')"
			echo -n "$(_wrap $usr_c $user)@$(_wrap $usr_c $hostname)"
		fi
	fi
}
function _print_rel_dir () {
	# using `|` instead of `/` for these regexes because paths
	if rel_path="$(git rev-parse --show-prefix 2>/dev/null)"; then
		_wrap $dir_c $(sed 's|^$|.|; s|/$||' <<< $relpath)
	else
		_wrap $dir_c $(pwd -L | sed "s|$HOME|~|")
	fi
}

export PS1='[\u@\h \d]$ '
export PROMPT_COMMAND=prompter
function prompter() {
	export PS1="[$(_print_location) $(_print_rel_dir)]\$ "
}

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(thefuck --alias)
