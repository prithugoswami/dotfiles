# export PATH="$PATH:$(du $HOME/bin/ | cut -f2 | tr '\n' ':' | sed 's/:$//')"
export EDITOR="/usr/bin/vim"
# export BROWSER="/usr/bin/firefox-developer-edition"
export BROWSER="/usr/bin/chromium"
export DMENU_ARGS="-nb "#000" -sb "#FFF" -sf "#000" -h 20"
export CM_SELECTIONS="clipboard"
export TERMINAL="/usr/local/bin/st"
export NNN_USE_EDITOR=1
export NNN_OPENER=xdg-open
export N_PREFIX="$HOME/.node_versions"
# export OPENER=xdg-open


export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
source $HOME/.config/secrets

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/bin/scripts:$PATH"
export PATH="$HOME/.node_versions/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# . "$HOME/.cargo/env"
export LIBVA_DRIVER_NAME=iHD
