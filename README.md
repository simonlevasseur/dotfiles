# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install git
brew install git

# Copy GitHub password from keychain access
git clone --bare https://github.com/simonlevasseur/dotfiles.git $HOME/.dotfiles

# Define dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Ignore untracked files
dotfiles config --local status.showUntrackedFiles no

# Checkout changes
dotfiles checkout

# Install everything
brew bundle

# Fix zsh compinit
chmod g-w /usr/local/share/zsh/ /usr/local/share/zsh/site-functions/

# Open iTerm

# Install Meslo Nerd Font
p10k configure

# Set iTerm preferences path
# Restart iTerm

# Open tmux
tat

# Install tmux plugins
C-a I

# Open neovim - plugins will auto-install
nvim
