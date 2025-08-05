#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza -lsnew'
alias lsa='eza -lasnew'
# alias minecraft='java -jar ~/Games/SKlauncher-3.2.12.jar'


# PATH Variables
export PATH="$HOME/.local/bin:\
$HOME/.cargo/bin:\
$HOME/.npm-global/bin:\
$HOME/.yarn/bin:\
$HOME/.config/yarn/global/node_modules/.bin:\
$HOME/.local/share/gem/ruby/3.0.0/bin:\
$HOME/.cargo/env:\
/root/.local/share/gem/ruby/3.0.0/bin:\
/usr/local/bin:\
/usr/share/nvm/init-nvm.sh:\
(go env GOPATH)/bin:\
$JAVA_HOME/bin:\
$PATH"

# Define color escape sequences
RESET="\[\e[0m\]"    # Reset color
BOLD="\[\e[1m\]"     # Bold text
BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"

parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

PS1="[$BLUE\u@\h $CYAN\w$RESET]$MAGENTA\$(parse_git_branch | sed 's/^/  /') $YELLOW\$$RESET "

# Auto-start tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

#Yazi cd automation
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


alias goland="/opt/goland/bin/goland"
alias toolbox="/opt/toolbox/jetbrains-toolbox"
alias idea-ce="/opt/idea-IC/bin/idea"
