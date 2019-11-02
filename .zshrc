# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/slim/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
	extract
	osx
	sudo
	brew
	docker
	python
)

# required for zsh-completions
autoload -U compinit && compinit

# ohmyzsh init
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# substring search activation
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# asdf stuff
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# colorls - needs to be after asdf init as ruby is loaded there
source "$(dirname $(gem which colorls))/tab_complete.sh"

# for homebrew
export PATH="/usr/local/sbin:$PATH"

###################
# Aliases & Funcs #
####################

# lc - colorized ls -la
alias lc='colorls -lA --sd'

# fuck - auto attempt to fix cmd
eval "$(thefuck --alias)"

# grow - tree alias function
grow() {
	if [[ "$1" = "" ]]; then
		if [[ "$2" = "" ]]; then
			tree -L 3 .
		else
			tree -L 3 $2
		fi
	else
		if [[ "$2" = "" ]]; then
			tree -L $1 .
		else
			tree -L $1 $2
		fi
	fi
}

