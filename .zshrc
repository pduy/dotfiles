# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/duy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
bindkey -v

set -o vi

export PATH="/home/duy/anaconda3/bin:$PATH"

# added by Anaconda2 2.5.0 installer
export PATH="/home/duy/anaconda2/bin:$PATH"

export PATH="/home/duy/Programs/hadoop/sbin/:/home/duy/Programs/hadoop/bin:$PATH"
export HADOOP_CLASSPATH="${JAVA_HOME}/lib/tools.jar"
export CQLSH_NO_BUNDLED=TRUE
export SPARK_HOME=/home/duy/Programs/spark
export PATH="$PATH:$SPARK_HOME/bin"
export PATH="$PATH:/home/duy/Programs/redis-4.0.2/src"
export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/cuda-9.0/bin${PATH:+:${PATH}}"
export CUDA_HOME="/usr/local/cuda-9.0"
#export GOOGLE_APPLICATION_CREDENTIALS="/home/duy/personal_stuff/personal-project-3c5da29eb5ef.json"

#synclient ClickFinger3=2
synclient TapButton3=2

# keychain id_rsa id_rsa_github id_rsa_bitbucket id_rsa_ibm  ~/.keychain/`uname -n`-sh

alias vim='vim --servername vim'

alias g='git'
alias gst='git status'
alias ga='git add'
alias gau='git add -u'
alias gr='git rebase'
alias gri='git rebase -i'
alias gcm='git commit -m'
alias gca='git commit -amend'
alias gpull='git pull'
alias gpush='git push'
alias gpo='git push origin'
alias gcheck='git checkout'
alias gstash='git stash'

alias code='code --disable-gpu'

alias conda3='/home/duy/anaconda3/bin/conda'
alias pip3='/home/duy/anaconda3/bin/pip'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
