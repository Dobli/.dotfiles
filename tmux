# --- GENERAL --- {{{
# Enable color support
set -g default-terminal "screen-256color"
# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse on
# }}}

# --- KEY BINDINGS --- {{{
# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
# switch panes using Alt-vim keys without prefix
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D
# split panes with meta without prefix
bind -n M-v split-window -v
bind -n M-b split-window -h
# }}}

# vim:foldmethod=marker:foldlevel=0:ft=tmux
