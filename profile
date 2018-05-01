export PATH="$HOME/.dotfiles/bin:$PATH"
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/.nextCloud/Code/Python
# export TMUXIFIER_LAYOUT_PATH="$HOME/.dotfiles/tmux-layouts"
source /usr/bin/virtualenvwrapper.sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# eval "$(tmuxifier init -)"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx >/dev/null 2>&1
