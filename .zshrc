# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Zinit plugins
zinit ice wait lucid blockf atpull='zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit ice wait lucid atinit='zicompinit; zicdreplay'
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# Powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Disable Powerlevel10k wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Remove computer name from prompt
prompt_context(){}

# Add ~/bin to PATH
export PATH=$PATH:~/bin

# Load dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Always stay in tmux
#[[ -z "$TMUX" ]] && tat

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lg='lazygit'
alias vi="nvim"
alias vim="nvim"

# FZF use rg
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob="!{.git/*}"'
if [ -e /Users/slevasseur/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/slevasseur/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
