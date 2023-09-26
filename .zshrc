# Disabling below tmux script in favor of oh-my-zsh tmux plugin autostart: https://gdevops.gitlab.io/tuto_cli/shells/zsh/oh_my_zsh/plugins/tmux/tmux.html
# start tmux if not vscode term
#if [ "$TMUX" = "" ]; then
    # Kill existing tmux session
#    tmux kill-session -t htp
#    tmux new -s htp "curl wttr.in; $SHELL";
#fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# else 
# [ "$TERM_PROGRAM" == "vscode" ]; then
#     cowsay "Detected vscode terminal, not starting tmux."
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    python
    pyenv
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
    # poetry
)

# Autostart tmux using tmux plugin
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################################################################

# TODO: Move all below settings to proper setup
# examples here: https://github.com/search?q=zsh+dotfiles

# Explanation of different zsh files (zshenv, zprofile, zshrc, zlogin, etc.):
# ref: https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

# Invocation order: .zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login] → [.zlogout sometimes]
# ref: Gabriel L. reply to above stackexchange post

############################################################################

# Add firefox developer edition to path
# /usr/bin/firefox is symlink -> /opt/firefox-developer/firefox/firefox
export PATH=/usr/bin/firefox:$PATH

# Pyenv config
# Note: as per https://github.com/pyenv/pyenv/#installation PATH setup is located:
#   - .zshrc (here)
#   - .profile
#   - .zprofile
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# configure nvm
# set NVM_DIR env var
export NVM_DIR="$HOME/.nvm"
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# load nvm completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# add cargo to path
export PATH="/home/sam/.cargo/bin:$PATH"

# setup go
export PATH="$PATH:/usr/local/go/bin"

# This is a roundabout way to start ipython from inside a virtualenv without it being installed
# in that virtualenv. The only caveot is that the "global" python must have ipython installed.
# What this function does that's different than simply calling the global ipython is it ensures to
# call the ipython that is installed for the same major.minor python version as in the virtualenv.
# This is most useful if you use pyenv for example as global python3 could be 3.7 and local
# virtualenv python3 is 3.6.
function ipy {
  local PY_BIN
  local IPYTHON
  local PYV
  # This quick way will work if ipython is in the virtualenv
  PY_BIN="$(python -c 'import sys; print(sys.executable)')"
  IPYTHON="$(dirname "$PY_BIN")/ipython"
  if [[ -x "$IPYTHON" ]]; then
    "$IPYTHON"
  else
    # Ask the current python what version it is
    PYV="$(python -c 'import sys; print(".".join(str(i) for i in sys.version_info[:2]))')"
    echo "Looking for iPython for Python $PYV"
    # In a new shell (where pyenv should load if equipped) try to find that version
    PY_BIN="$($SHELL -i -c "python$PYV -c 'import sys; print(sys.executable)'")"
    "$(dirname "$PY_BIN")/ipython"
  fi
}

# Workaround for annoying pyenv-virtualenv message:
# pyenv-virtualenv: prompt changing will be removed from future release. configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior.
# source: https://github.com/pyenv/pyenv-virtualenv/issues/135#issuecomment-712534748
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export BASE_PROMPT=$PS1
function updatePrompt {
    if [[ "$(pyenv version-name)" != "system" ]]; then
        # the next line should be double quote; single quote would not work for me
        export PS1="($(pyenv version-name)) "$BASE_PROMPT 
    else
        export PS1=$BASE_PROMPT
    fi
}
export PROMPT_COMMAND='updatePrompt'
precmd() { eval '$PROMPT_COMMAND' } # this line is necessary for zsh

# Deno
export DENO_INSTALL="/home/sam/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Lazy tool aliases
alias lzd='lazydocker'
alias lzg='lazygit'

# docker login ECR alias
# COMMENT OUT TO SUPPRESS IAM ERROR MESSAGES FROM DISABLED CLAVIATE ACCOUNT
# alias docker-ecr-login="docker login -u AWS -p $(aws ecr get-login-password --region eu-west-1) 594162119682.dkr.ecr.eu-west-1.amazonaws.com"

# ls -la with numerical permissions
alias cls="ls -l | awk   '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
export PATH=/home/sam/bin:$PATH

[[ -e "/home/sam/lib/oracle-cli/lib/python3.9/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/slim/lib/oracle-cli/lib/python3.9/site-packages/oci_cli/bin/oci_autocomplete.sh"

# Nim binary
export PATH=/home/sam/.nimble/bin:$PATH

# Poetry
export PATH=/home/sam/.local/bin:$PATH

