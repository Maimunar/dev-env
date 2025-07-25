source $HOME/.config/shell/sshEval.sh
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source $HOME/.config/shell/p10kSetup.sh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source $HOME/.config/shell/brew.sh
source $HOME/.config/shell/zinit.sh
source $HOME/.config/shell/nvm.sh
source $HOME/.config/shell/history.sh
source $HOME/.config/shell/fzf.sh
source $HOME/.config/shell/yazi.sh
source $HOME/.config/shell/gcloud.sh
source $HOME/.config/shell/aliases.sh
source $HOME/.config/shell/completionStyling.sh
source $HOME/.config/shell/pnpm.sh

bindkey -v

export XDG_CONFIG_HOME="$HOME/.config"

export ATAC_KEY_BINDINGS=~/.config/atac/keybindings.toml

# export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=$PATH:/Users/aleksandarivanov/.spicetify

