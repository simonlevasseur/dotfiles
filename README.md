# Installation
1. Install Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install git `brew install git`
3. Clone dotfiles `git clone https://github.com/simonlevasseur/.dotfiles.git $HOME/.dotfiles`
4. Install everything `brew bundle`
5. Open Kitty
6. Install TMUX plugins `tat && <C-a> + I`
7. Install NVIM plugins  `nvim` plugins will auto-install

# GNU Stow
Useful [article](https://apiumhub.com/tech-blog-barcelona/managing-dotfiles-with-stow/).

```bash
cd ~/.dotfiles

# Preview what stow will do
# `-n` does not perform action
# `-v` verbose
stow -nv folder

# Stow all directories to ~
stow */

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

# SKHD
```bash
# Restart service
ctrl + alt - r
```
