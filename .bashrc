#
# ~/.bashrc
#
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.profile ]] && . ~/.profile

cd() {
	builtin cd "$@" && ls --color;
}

sman(){
    man `man -k . | fzf -i --reverse --height=40% --tiebreak=begin |\
        cut -d ' ' -f1`
}

# 'f'ind 'e'dit
fe(){
    vim "`fzf -i --reverse --height=40%`"
}

# f - simply cd's into the dir beneath the current
f(){
    cd "$(dirname "$(fzf -i --reverse --height=40%)")"
}

# find from home
fh(){
    cd "$(dirname "$(find ~/* -type f | fzf -i --reverse --height=40% )")"
}

# find from home and edit
fhe(){
    vim "$(find ~/* -type f | fzf -i --reverse --height=40% )"
}

# cheat.sh
cheat(){
    curl -s cheat.sh/$1
}

pdrc(){
    ping -c 1 8.8.8.8 > /dev/null || return
    rclone cat drop:/pd/pd > /tmp/pd && gpg -o /tmp/pd.tmp -d /tmp/pd &&\
        less /tmp/pd.tmp && rm /tmp/pd.tmp && rm /tmp/pd
}

pdrl(){
    cp ~/dropbox/pd/pd /tmp/pd || return
    gpg -o /tmp/pd.tmp -d /tmp/pd || (rm /tmp/pd && return)
    less /tmp/pd.tmp && rm /tmp/pd.tmp && rm /tmp/pd
}

dropsync(){
	case "$1" in
		"pull") rclone sync -v drop:/ $HOME/dropbox/ "${@:2}" ;;
		"push") rclone sync -v $HOME/dropbox drop:/  "${@:2}" ;;
	esac
}


alias t="task"
alias todo="task modify -in"

alias cfi="vim ~/.config/i3/config"
alias cfz="vim ~/.zshrc"
alias cfb="vim ~/.bashrc"
alias cfp="vim ~/.profile"
alias cfv="vim ~/.vimrc"
alias cfx="vim ~/.Xresources"
alias cfr="vim ~/.config/ranger/rifle.conf"
alias rx="xrdb ~/.Xresources"
alias tmux="tmux -u"
alias ch="ping 8.8.8.8"
alias n="nautilus"
alias yv="youtube-viewer"
alias mkddir="mkdir `date +%d-%m-%Y`"

alias ls='ls --color=auto'

#PS1='\[\033[34m\][\u@\h\[\033[01;00m\] \W\[\033[34m]\]\[\033[00m\]\$ '

#PS1='\[\033[01;32m\]ॐ [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
PS1='\[\033[01;32m\]⮞ [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
#PS1='\[\033[01;32m\]🡲 [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
#PS1='\[\033[01;32m\]● [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
