# Set XDG environment variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=$HOME/.local/run

# Use neovim as the default editor
# Apps should look at VISUAL first, then EDITOR
# In .zshrc we alias vim to nvim
export EDITOR=nvim
export VISUAL=nvim

# Use open to launch the default browser on macOS
[[ "$OSTYPE" == darwin* ]] && export BROWSER=open
