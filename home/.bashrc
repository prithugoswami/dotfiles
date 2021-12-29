#
# ~/.bashrc
#
set -o vi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.profile ]] && . ~/.profile

alias ls='ls --color=auto'

cd() {
	builtin cd "$@" && ls;
}

[[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

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

# find from home and don't include *repos* in path
fh(){
    cd "$(dirname "$(find -H ~/* ! -path '*repos*' -type f | fzf -i --reverse --height=40% )")"
}

# find from home and edit
fhe(){
    vim "$(find -H ~/* ! -path '*repos*' -type f | fzf -i --reverse --height=40% )"
}

# find and open
fo(){
    rifle "$(fzf -i --reverse --height=40%)"
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

inb(){
    if [ "$#" = "0" ]; then
        task next +in
    else
        task add +in "$@"
    fi
}

alias t="task"
alias o="rifle"

todo(){
    if [ $# -eq 0 ]; then
        task -in
    else
        task modify -in "$@"
    fi
}

alias cfi="vim ~/.config/i3/config"
alias cfz="vim ~/.zshrc"
alias cfb="vim ~/.bashrc"
alias cfp="vim ~/.profile"
alias cfv="vim ~/.vimrc"
alias cfx="vim ~/.Xresources"
alias cfr="vim ~/.config/ranger/rifle.conf"
alias etf="vim ~/docs/org/todo.txt"
alias egc="vim ~/docs/org/growth-cal.txt"
alias rx="xrdb ~/.Xresources"
alias tmux="tmux -u"
alias ch="ping 8.8.8.8"
alias n="nautilus"
alias yv="youtube-viewer"
alias mkddir="mkdir `date +%d-%m-%Y`"
alias thot="vim ~/docs/org/thoughts/`date +%s`"
alias tt="transmission-remote"
# alias yw="mpv --ytdl-format=\"best[height<=480]\""
alias yw="mpv --ytdl-format=\"bestvideo[height<=480]+bestaudio/best[height<=480]\""
alias yal="mpv --ytdl-format=251"
alias tmuxl="tmux list-session"
alias rl="gpg -d ~/docs/org/lifelog/ll.gpg | sed 's/\t/ │ /' | less"
alias tb="nc termbin.com 9999"
alias tl="curl -s https://api.kraken.com/0/public/Ticker?pair=XBTUSD | jq -r '.result.XXBTZUSD.c[0]' | cut -d. -f1"
alias tf="terraform"
alias tss="timesheetctl s"
alias tse="timesheetctl e"


#alias ls='ls'


#PS1='\[\033[34m\][\u@\h\[\033[01;00m\] \w\[\033[34m]\]\[\033[00m\]$ '
# PS1="\[\033[01;34m\][\[\033[01;00m\]\w\[\033[01;34m\]]\[\033[01;00m\]\[\033[01;32m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2 | sed 's/^/ (/' | sed 's/$/)/') \[\033[01;00m\]\n› "
PS1="\w\[\033[01;34m\]\[\033[01;00m\]\[\033[01;32m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2 | sed 's/^/ (/' | sed 's/$/)/') \[\033[01;00m\]› "

#PS1='\[\033[01;32m\]ॐ [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
#PS1='\[\033[01;32m\]⮞ [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
#PS1='\[\033[01;32m\]🡲 [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '
#PS1='\[\033[01;32m\]● [\[\033[37m\]\w\[\033[32m\]]\[\033[00m\] '

[[ -f ~/bin/bash_prompt.sh ]] && . ~/bin/bash_prompt.sh

HISTCONTROL=ingoreboth
HISTSIZE=100000000
HISTFILESIZE=100000000
PROMPT_COMMAND='history -a'
HISTIGNORE='ls:bg:fg:history:cd:rm'

slugen () {
    # generate a slug of alphabets
    dd if=/dev/urandom status=none bs=1024 count=1 | strings | tr -d '[:space:][:punct:][:digit:][Ilq]' | cut -c -${1:-4}
}
PROMPT_DIRTRIM=2

activate_nvm () {
    source /usr/share/nvm/init-nvm.sh
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

complete -C /usr/bin/terraform terraform
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
