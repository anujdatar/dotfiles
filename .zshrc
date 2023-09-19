# ################################################################
# your standard zshrc here
# ################################################################

# Load user profile file
if [ -f "$HOME/.profile" ]; then
  . $HOME/.profile
fi

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
# tmux attach -t default || tmux new -s default
# fi
