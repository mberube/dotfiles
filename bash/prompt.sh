# Setup some colors to use later in interactive shell or scripts
export EDITOR=vi

export COLOR_NC=$'\e[0m' # No Color
export COLOR_WHITE=$'\e[1;37m'
export COLOR_BLACK=$'\e[0;30m'
export COLOR_BLUE=$'\e[0;34m'
export COLOR_LIGHT_BLUE=$'\e[1;34m'
export COLOR_GREEN=$'\e[0;32m'
export COLOR_LIGHT_GREEN=$'\e[1;32m'
export COLOR_CYAN=$'\e[0;36m'
export COLOR_LIGHT_CYAN=$'\e[1;36m'
export COLOR_RED=$'\e[0;31m'
export COLOR_LIGHT_RED=$'\e[1;31m'
export COLOR_PURPLE=$'\e[0;35m'
export COLOR_LIGHT_PURPLE=$'\e[1;35m'
export COLOR_BROWN=$'\e[0;33m'
export COLOR_YELLOW=$'\e[1;33m'
export COLOR_GRAY=$'\e[1;30m'
export COLOR_LIGHT_GRAY=$'\e[0;37m'

function hg_prompt_info() {
#hg prompt "{[+{incoming|count}]-->}{root|basename}{/{branch}}{-->[+{outgoing|count}]}{ at {bookmark}}{status}" 2> /dev/null
	hg prompt "[{branch}{status}{update}]" 2>/dev/null
}

function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function git_prompt_info {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function prompt_char {
	git branch >/dev/null 2>/dev/null && echo ' ±' && return
	hg root >/dev/null 2>/dev/null && echo ' ☿' && return
	echo '$'
}

#export PS1='$(hg_ps1)\n\u at \h in \w\n$ '
export PS1='\[${COLOR_BLUE}\]\u@\h: \[${COLOR_GREEN}\]\w \[${COLOR_GRAY}\]$(hg_prompt_info)$(git_prompt_info)\[${COLOR_NC}\]$(prompt_char) '
