# ---------------------------------------------------------------
# Plugins
# ---------------------------------------------------------------

# Load Antidote package manager
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# Load plugins
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---------------------------------------------------------------
# Exports
# ---------------------------------------------------------------

# Customize bat
export BAT_THEME=Nord

# Customize pager used by bat
# -i  Case-insensitive search except when using uppercase
# -R  Support colors
export BAT_PAGER="less -iR"

# Customize pager used by man
# sh  -c  Execute shell with given command
# col -b  Do not output backspaces -- fixes manpage alignment
# col -x  Use spaces instead of tabs
# bat -l  Set language to man
# bat -p  Use plain style, no line numbers, proper line wrapping
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# ---------------------------------------------------------------
# Misc
# ---------------------------------------------------------------

# Enable commands like: run-help bindkey
unalias run-help 2>/dev/null  # don't display err if already done
autoload -Uz run-help         # load the function
alias help=run-help           # call help instead of run-help

# Load new zsh completion system
autoload -Uz compinit
compinit

# Customize prompt when not using p10k
PS1="%F{blue}%~%f $ "         # ~/.dotfiles $ ...

# Load p10k
# [[ -f ${XDG_CONFIG_HOME:-$HOME}/zsh/.p10k.zsh ]] && source ${XDG_CONFIG_HOME:-$HOME}/zsh/.p10k.zsh
# source $(antidote path https://github.com/romkatv/powerlevel10k)/config/p10k-robbyrussell.zsh
source $(antidote path https://github.com/romkatv/powerlevel10k)/config/p10k-pure.zsh

# ---------------------------------------------------------------
# PATH
# ---------------------------------------------------------------

# Add ~/bin to PATH
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# Add homebrew to PATH
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# Add dev to PATH
[[ -f /opt/dev/dev.sh ]] && source /opt/dev/dev.sh
