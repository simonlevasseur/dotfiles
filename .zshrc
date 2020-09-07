### Added by Zplugin's installer
if [[ ! -d $HOME/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin ice wait blockf atpull="zplugin creinstall -q ." lucid
zplugin light zsh-users/zsh-completions

zplugin ice wait atinit="zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait atload="_zsh_autosuggest_start" lucid
zplugin light zsh-users/zsh-autosuggestions

# Powerlevel10k theme
zplugin ice depth=1
zplugin light romkatv/powerlevel10k

# Disable Powerlevel10k wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Remove computer name from prompt
prompt_context(){}

# Add ~/bin to PATH
export PATH=$PATH:~/bin

# Load dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Always stay in tmux
[[ -z "$TMUX" ]] && tat

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lg='lazygit'

# FZF use rg
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob="!{.git/*}"'
if [ -e /Users/slevasseur/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/slevasseur/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
