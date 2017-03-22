set -o vi
autoload -Uz compinit
compinit
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# [ -f /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ] && source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# [ -f /opt/homebrew/share/zsh-completions/zsh-completions.plugin.zsh ] && source /opt/homebrew/share/zsh-completions/zsh-completions.plugin.zsh
# [ -f /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function cursor {
    [ -d "/Applications/Cursor.app" ] && open -a "/Applications/Cursor.app" "$@"
}

setopt HIST_IGNORE_SPACE

# -----------------------------------------------------------------------------
# Brew Cask -------------------------------------------------------------------
# -----------------------------------------------------------------------------
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# -----------------------------------------------------------------------------
# Node ------------------------------------------------------------------------
# -----------------------------------------------------------------------------
[ -x "$(command -v fnm)" ] && eval "$(fnm env --use-on-cd --shell zsh)"

# -----------------------------------------------------------------------------
# Golang ----------------------------------------------------------------------
# -----------------------------------------------------------------------------
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# -----------------------------------------------------------------------------
# Rust ------------------------------------------------------------------------
# -----------------------------------------------------------------------------
[ -d "$HOME/.cargo/env" ] && source $HOME/.cargo/env

# -----------------------------------------------------------------------------
# Python ----------------------------------------------------------------------
# -----------------------------------------------------------------------------
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# -----------------------------------------------------------------------------
# Dart ------------------------------------------------------------------------
# -----------------------------------------------------------------------------
[ -d "$HOME/.pub-cache/bin" ] && export PATH=$HOME/.pub-cache/bin:$PATH

# -----------------------------------------------------------------------------
# Flutter ---------------------------------------------------------------------
# -----------------------------------------------------------------------------
[ -d "/usr/local/flutter" ] && export PATH=/usr/local/flutter/bin:$PATH
[ -d "$HOME/flutter" ] && export PATH=$HOME/flutter/bin:$PATH

# -----------------------------------------------------------------------------
# Ruby ------------------------------------------------------------------------
# -----------------------------------------------------------------------------
if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init - zsh)"
fi

# -----------------------------------------------------------------------------
# Java ------------------------------------------------------------------------
# -----------------------------------------------------------------------------
if [[ -n "$(echo /Library/Java/JavaVirtualMachines/*(N))" ]]; then
    export JAVA_HOME="$(echo /Library/Java/JavaVirtualMachines/jdk*/Contents/Home)"
fi

# -----------------------------------------------------------------------------
# Android ---------------------------------------------------------------------
# -----------------------------------------------------------------------------
if [[ -n "$(echo $HOME/Library/Android/sdk)" ]]; then
    export PATH=$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH
fi

# -----------------------------------------------------------------------------
# App Engine ------------------------------------------------------------------
# -----------------------------------------------------------------------------
if [[ -n "$(echo /usr/local/Cellar/app-engine-go-64/*(N))" ]]; then
    export GO_APPENGINE_SDK="$(echo /usr/local/Cellar/app-engine-go-64/*/share/app-engine-go-64)"
    if [ ! -e "$GO_APPENGINE_SDK/goroot/pkg/darwin_amd64" ]; then
        ln -s $GO_APPENGINE_SDK/goroot/pkg/darwin_amd64_appengine $GO_APPENGINE_SDK/goroot/pkg/darwin_amd64
    fi
    alias appvim="export GOROOT=$GO_APPENGINE_SDK/goroot && nvim"
fi

# -----------------------------------------------------------------------------
# Kubernetes ------------------------------------------------------------------
# -----------------------------------------------------------------------------
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# -----------------------------------------------------------------------------
# AutoJump --------------------------------------------------------------------
# -----------------------------------------------------------------------------
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /etc/profile.d/autojump.sh ] && . /etc/profile.d/autojump.sh

# ----------------------------------------------------------------------
# FZF ------------------------------------------------------------------
# ----------------------------------------------------------------------
if [ -x "$(command -v fnm)" ]; then
    source <(fzf --zsh)
    export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    if [[ -s "$HOME/.fzf-git.sh" ]]; then
        source "$HOME/.fzf-git.sh"
    fi
fi

# -----------------------------------------------------------------------------
# Aliases ---------------------------------------------------------------------
# -----------------------------------------------------------------------------
alias workon="pyenv activate"
alias workoff="pyenv deactivate"
alias gitc="git b --merged | grep -v \"*\" | xargs -I {} git b -D \"{}\""
alias g="git"
alias gd="git diff"
alias wip="git add . && git commit -m WIP"
alias k="kubectl"

# -----------------------------------------------------------------------------
# Editor ----------------------------------------------------------------------
# -----------------------------------------------------------------------------
[[ $TMUX != "" ]] && export TERM="screen-256color"
[ -x "$(command -v tmuxifier)" ] && eval "$(tmuxifier init -)"
export PATH=$HOME/.tmux/plugins/tmuxifier/bin:$PATH
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export EDITOR="nvim"
export VISUAL="nvim"
export SHELL="zsh"
export BAT_THEME="palenight"
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

# ----------------------------------------------------------------------
# Custom ---------------------------------------------------------------
# ----------------------------------------------------------------------

# Graphite
[ -x "$(command -v gt)" ] && eval "$(gt completion)"
