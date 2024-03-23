# Installation
1. Install Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install git `brew install git`
3. Install stow `brew install stow`
4. Clone dotfiles `git clone https://github.com/simonlevasseur/.dotfiles.git $HOME/.dotfiles`
5. Stow everything `cd .dotfiles && stow */`
6. Install everything `cd && brew bundle`
7. Open Kitty
8. Install TMUX plugins `tat && <C-a> + I`
9. Install NVIM plugins  `nvim` plugins will auto-install

# GNU Stow
Useful [article](https://apiumhub.com/tech-blog-barcelona/managing-dotfiles-with-stow/).

```bash
cd ~/.dotfiles

# Preview what stow will do
# `-n` does not perform action
# `-v` verbose
stow -nv folder

# Stow all directories to ~
# `--no-folding` symlinks files, not folders
stow --no-folding */

# Remove a stowed directory
stow -D folder

# Relink a directory
# Useful after deleting a file from stow directory
stow -R folder
```

# Homebrew
`brew bundle`

# ZSH
## Commands

# TMUX
## Tmux Plugin Manager
```bash
# Install plugins
<prefix> + I

# Uninstall plugins
<prefix> + alt + u

#Update plugin
<prefix> + U
```

## Shortcuts
```bash
# Reload tmux.conf
<prefix> + R
```

## Commands
```bash
# Start with
<prefix> + :

# Set current window to number 1
swap-window -t 1
```

# VIM
## Help
```bash
# Go to link under cursor
<Ctrl> + ]
```

## Options
```bash
# Read the value
set number

# See all mappings in Normal mode
:nmap
```

# SKHD
```bash
# Restart service
ctrl + alt - r
```
