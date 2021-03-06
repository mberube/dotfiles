alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gs='git status'
alias gc='git commit'
alias gca='git commit -a'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gb='git branch'
alias gf='git fetch'
alias gpr='git pull --rebase'
alias gamend='git commit --amend'
alias killspring="ps aux | grep 'rspec\|spring' | grep -v grep | awk '{print \$2}' | xargs kill -9"

# rails aliases
alias r='rails'
alias be='bundle exec'
alias ber='bundle exec rake'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

function bundle_find {
  grep "$@" -r $(bundle show --paths)
}
