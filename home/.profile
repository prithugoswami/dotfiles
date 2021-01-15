export PATH="$PATH:$(du $HOME/bin/ | cut -f2 | tr '\n' ':' | sed 's/:$//')"
export EDITOR="/usr/bin/vim"
# export BROWSER="/usr/bin/firefox-developer-edition"
export BROWSER="/usr/bin/chromium"
export DMENU_ARGS="-nb "#000" -sb "#FFF" -sf "#000" -h 20"
export CM_SELECTIONS="clipboard"
export TERMINAL="/usr/local/bin/st"
export NNN_USE_EDITOR=1
export NNN_OPENER=rifle
export OPENER=rifle

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
source $HOME/.config/secrets
