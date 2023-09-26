# My Dotfiles

> Last updated: 09/26/2023

This is still a WIP, as I need to properly document each dotfile, and add any others I'm missing.

## Current Dotfiles

These dotfiles are primarily for replicating my zsh, oh-my-zsh, and tmux configurations with all of their respective plugins.

Other dotfiles have been added for posterity (`.bashrc`, `.profile`).


### Prerequisites

TODO: Document all extensions, plugins, etc. Are needed for each module (`oh-my-zsh`, `tmux`, `vim`, potentially more

#### Theme and Font

C**olor theme:** [Dracula](https://draculatheme.com/)

Currently using as primary scheme for

* system
* terminal
* tmux
* vscode
* many other apps

**Font:** Powerlevel10k reccomends a few different options. I currently really like the [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#fonts) which looks fantastic.x

*Note*: May need to install patched fonts manually, see above link.

#### System Packages

Main system-wide packages needed for minimal setup. Install with whatever package manager (`apt-get`, `brew`, etc.) your system uses

* [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) - shell
* [oh-my-zsh](https://ohmyz.sh/) - framework mana
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [tmux](https://github.com/tmux/tmux/wiki)


##### zsh/oh-my-zsh Plugins

```zsh
plugins=(
    git
    python
    pyenv
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
)
```

###### Plugin Links

* [pyenv](https://github.com/pyenv/pyenv) - *Python version management*
  * use the [installer script](https://github.com/pyenv/pyenv-installer)
  * Be sure to install extension for virtual environments [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - *Fish-like autosuggestions for zsh*
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - *Fish shell like syntax highlighting for Zsh.*
* tmux - *terminal multiplexer. Should already be installed, see system packages*

TODO: Add the additional packages needed for current setup. eg:

* docker
* nvm
* nim
* poetry
* ipynb/jupyter
* etc.

##### Vim

Install [vim-plug](https://github.com/junegunn/vim-plug) - *🌺 Minimalist Vim Plugin Manager*

This is required for adding necessary QoL addons to Vim. Currently set up for C++ development. TODO: Fullstack vim setup. eg. python, other languages, formatters, linters, etc.

Plugins:

* [Clang-format](https://github.com/rhysd/vim-clang-format) - *Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, and so on.*
* ~~[Syntastic](https://github.com/vim-syntastic/syntastic) - *Syntax checking hacks for vim*~~
  * ***Note:*** *deprecated as of Sep 20, 2023 in favor of ALE*:
    * [ALE]() - *Check syntax in Vim/Neovim asynchronously and fix files, with Language Server Protocol (LSP) support*
    * TODO: Change current .vimrc to replace Syntastic with ALE.
* [Dracula](https://github.com/dracula/vim) - *Dracula theme for Vim*
