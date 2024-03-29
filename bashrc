# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

function cond_source () {
  [ -f $1 ] && . $1
}

source $HOME/.bash/shell.sh
source $HOME/.bash/cdargs-bash.sh
source $HOME/.commonsh/alias.sh

# shell is interactive?
if [[ $- =~ i ]]; then
	source      $HOME/.bash/prompt.sh
fi

for f in `ls $HOME/.bash/local`; do
  cond_source $HOME/.bash/local/$f
done

# if I have a ~/bin directory, put it in the path
if [ -d $HOME/bin ]; then
  export PATH=~/bin:$PATH
fi

PATH=$(pyenv root)/shims:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fuck() {
 USERNAME=mberube
 CURRENT=$(git remote -v | head -n 1 | awk '{print $2}')
 if [[ $CURRENT == ssh* ]]; then
  UPDATED=$(echo $CURRENT | sed "s_ssh://git_https://${USERNAME}_" | sed 's_:7999_/scm_')
  git remote set-url origin $UPDATED
  echo $UPDATED
 elif [[ $CURRENT == https* ]]; then
  UPDATED=$(echo $CURRENT | sed "s_https://${USERNAME}_ssh://git_" | sed 's_/scm_:7999_')
  git remote set-url origin $UPDATED
  echo $UPDATED
 else
  echo "Doesn't seem to be a git repo?"
 fi
}


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

[[ -s "/etc/profile.d/rvm.sh" ]] && source "/etc/profile.d/rvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

