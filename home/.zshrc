# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="om"

DEFAULT_USER="prithu"

# pywal colorscheme
#(cat ~/.cache/wal/sequences &)

# ls automatically right after cd'ing into a directory
cd() {
	builtin cd "$@" && ls --color;
}

# AutoJump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# Kill the delay while swtiching modes in vi-mode plugin
export KEYTIMEOUT=1

# ALIAS
alias cfi="vim ~/.i3/config"
alias cfz="vim ~/.zshrc"
alias cfv="vim ~/.vimrc"
alias cfx="vim ~/.Xresources"
alias cfr="vim ~/.config/rofi/config.rasi"
alias rx="xrdb ~/.Xresources"
alias sn="shutdown now"
alias rn="shutdown -r now"
alias :wq="exit"
alias tmux="tmux -u"
alias ch="ping 8.8.8.8"
alias yv="youtube-viewer"

#alias cfzf="cd $(fzf)"
#<cmd> | pastebin will upload the stdout of <cmd> and put the link
#in the clipboard
alias pastebin="curl -# -F c=@- https://ptpb.pw\?u=1 | xclip -selection c"
alias n="nautilus"
# Read the local copy of pd
alias pdrl="cp ~/Dropbox/pd/pd /tmp/pd \
            && gpg --passphrase-file ~/.pdkey --batch -o /tmp/pd.tmp -d /tmp/pd \
            && less /tmp/pd.tmp && rm /tmp/pd.tmp \
            && rm /tmp/pd"
# Read pd from the cloud
alias pdrc="ping -c 1 8.8.8.8 > /dev/null && rclone cat drop:/pd/pd > /tmp/pd \
            && gpg --passphrase-file ~/.pdkey --batch -o /tmp/pd.tmp -d /tmp/pd \
            && less /tmp/pd.tmp && rm /tmp/pd.tmp \
            && rm /tmp/pd"


# Task warrior Alias

in(){
    if [ "$#" = "0" ]; then
        task next +in
    else
        task add +in "$@"
    fi
}

#history search using fzf
h(){
    $(cat ~/.zsh_history | awk -F ';' '{ $1="" ; print }' | fzf --tac )
}


alias t="task"
alias todo="task modify -in"



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
