set -o vi
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

setopt HIST_IGNORE_SPACE
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# -----------------------------------------------------------------------------
# Brew Cask -------------------------------------------------------------------
# -----------------------------------------------------------------------------
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# -----------------------------------------------------------------------------
# Node ------------------------------------------------------------------------
# -----------------------------------------------------------------------------
export N_PREFIX="$HOME/n"
export PATH="$N_PREFIX/bin:$PATH"

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

# -----------------------------------------------------------------------------
# Spark -----------------------------------------------------------------------
# -----------------------------------------------------------------------------
# export SCALA_HOME=/usr/local/bin/scala
# export PATH=$PATH:$SCALA_HOME/bin
# if which pyspark > /dev/null; then
#     export SPARK_HOME="$(echo /usr/local/Cellar/apache-spark/*/libexec)"
#     export PYSPARK_SUBMIT_ARGS="--master local[2]"
#     export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
# fi

# -----------------------------------------------------------------------------
# Aliases ---------------------------------------------------------------------
# -----------------------------------------------------------------------------
alias workon="pyenv activate"
alias workoff="pyenv deactivate"
alias gitc="git b --merged | grep -v \"*\" | xargs -I {} git b -D \"{}\""
alias g="git"
alias gd="git diff"
alias wip="git add . && git commit -m WIP"
alias mux="gmux"
alias s="sequelize"
alias cl="conventional-changelog"
alias k="kubectl"
alias mk="microk8s kubectl"

# -----------------------------------------------------------------------------
# Editor ----------------------------------------------------------------------
# -----------------------------------------------------------------------------
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export EDITOR="nvim"
export VISUAL="nvim"
export SHELL="zsh"
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
[[ $TMUX != "" ]] && export TERM="screen-256color"
