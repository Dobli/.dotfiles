# This setup depends on following packages
#  i3blocks
#  rofi
#  ttf-font-awesome (aur)
#  stalonetray

#  ----- Window settings {{{
#gaps 
for_window [class="^.*"] border pixel 0
gaps inner 14
#smart_gaps on

#thin borders
hide_edge_borders both

#Window float preferences
for_window [class="Nextcloud"] floating disable
for_window [class="mpv"] floating enable; 
for_window [class="mpv"] resize set 560 315;
for_window [class="mpv"] sticky enable;
# }}}

#  ----- Theming {{{
# Font
font pango:SourceCodeProMedium, FontAwesome5Free, FontAwesome5Brands 11

# Define Xresource colors
set_from_resource $background  background #000000
set_from_resource $background2 color18    #000000
set_from_resource $background3 color19    #000000
set_from_resource $background4 color8     #000000
set_from_resource $foreground  foreground #000000
set_from_resource $foreground2 color20    #000000
set_from_resource $foreground3 color21    #000000
set_from_resource $foreground4 color15    #000000

set_from_resource $red         color9     #000000
set_from_resource $orange      color16    #000000
set_from_resource $yellow      color11    #000000
set_from_resource $green       color10    #000000
set_from_resource $cyan        color14    #000000
set_from_resource $blue        color12    #000000
set_from_resource $magenta     color13    #000000
set_from_resource $brown       color17    #000000

set $border-color #2d2d2d
set $signal-bg-color #f2777a
set $signal-text-color #3d3d3d

# Window colors
#                       border          background         text                 indicator
client.focused          $blue           $blue              $background          $red
client.unfocused        $background     $background        $foreground          $red
client.focused_inactive $cyan           $cyan              $background          $red
client.urgent           $background     $signal-bg-color   $signal-text-color   $red
# }}}

#  ----- Workspaces {{{
set $ws1 "1  Web"
set $ws2 "2  Terminal"
set $ws3 "3  E-Mail"
set $ws4 "4  Files"
set $ws5 "5  Develop"
set $ws6 "6  Other"
set $ws7 "7  Other"
set $ws8 "8  Chat"
set $ws9 "9  Music"
set $ws10 "10  Status"

# assign workspaces to outputs
workspace $ws1 output DP-1
workspace $ws3 output DVI-I-1

# Assign applications to workspaces
assign [class="Firefox"] $ws1
assign [class="Evolution"] $ws3
assign [class="jetbrains-studio"] $ws5
assign [class="jetbrains-idea-ce"] $ws5
assign [class="Nextcloud"] $ws10
# }}}

#  ----- Keybindings {{{
#mouse focus
focus_follows_mouse yes

# Hotkey
set $mod Mod4

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

#Stick window to screen modifier
bindsym $mod+Shift+s sticky toggle

# move the currently focused window to the scratchpad
bindsym $mod+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym $mod+minus scratchpad show

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher) or rofi
# bindsym $mod+d exec --no-startup-id rofi -show run -lines 3 -eh 2 -width 100 -padding 440 -opacity "80" -bw 0 -bc "$bg-color" -bg "$bg-color" -fg "$text-color" -hlbg "#9575cd" -hlfg "$bg-color" -font "Liberation Mono 18"
bindsym $mod+d exec --no-startup-id "rofi -show drun -modi 'drun,run,window' -window-format '{w:14}{c:16} {t}'"
bindsym $mod+Shift+f exec --no-startup-id xdg-open "$(locate home | rofi -threads 0 -dmenu -i -p 'open')"
bindsym $mod+Shift+x exec --no-startup-id gvim ~/.dotfiles/"$(ls ~/.dotfiles | rofi -threads 0 -dmenu -i -p 'config')"
# bindsym $mod+Shift+t exec --no-startup-id translate_menu
bindsym $mod+Shift+t exec --no-startup-id todo done $(todo | rofi -threads 0 -dmenu -i -p 'todos' | cut -d '[' -f 1)
bindsym $mod+o exec --no-startup-id rofi-pass

# change focus
bindsym $mod+j focus left
bindsym $mod+odiaeresis focus down
bindsym $mod+l focus up
bindsym $mod+k focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+odiaeresis move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+k move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# move workspace to monitor
bindsym $mod+m move workspace to output left

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10
# move to last workspace
workspace_auto_back_and_forth yes
bindsym $mod+b workspace back_and_forth
bindsym $mod+Shift+b move container to workspace back_and_forth; workspace back_and_forth
#navigate workspaces next / previous
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
# }}}

#  ----- Modes {{{
# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym odiaeresis resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"
# }}}

#  ----- Statusbars {{{
# Top bar
bar {
	height 35
	tray_output None
	tray_padding 4
        i3bar_command i3bar 
        status_command i3blocks

	font pango:SourceCodeProMedium, FontAwesome5Free, FontAwesome5Brands 11
	position top
	colors {
                background $background
                separator $background
                #                  border            background        text
                focused_workspace  $blue             $blue             $background
                active_workspace   $background2      $background2      $foregorund
                inactive_workspace $background       $background       $foreground
                urgent_workspace   $red              $red              $background
        }
}
# }}}

# ----- Additional shortcuts {{{

# Lockscreen
bindsym $mod+X exec blurlock

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound
bindsym $mod+Ctrl+m exec pavucontrol
## Change Output device
bindsym $mod+shift+o exec movesinks 1

# Brightness controls
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 10
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 10

# MPD Controls with clerk
bindsym $mod+c exec clerk

# Toggle tray
bindsym $mod+t exec --no-startup-id tray_toggle

# External Display Toggle
bindsym $mod+p exec --no-startup-id toggle_display

# Screenshot
# bindsym Print exec gnome-screenshot
# bindsym Shift+Print exec 'gnome-screenshot -a -c'
bindsym Print exec --no-startup-id scrot
bindsym $mod+Print --release exec --no-startup-id scrot -w
bindsym $mod+Shift+Print --release exec --no-startup-id scrot -s
# }}}

#----- Autostart {{{
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec_always --no-startup-id display_layout_default
exec --no-startup-id nitrogen --restore; sleep 1; compton -f -b
exec --no-startup-id evolution
exec --no-startup-id nm-applet
exec --no-startup-id pamac-tray
exec --no-startup-id pulseaudio --start
exec --no-startup-id pa-applet
#exec --no-startup-id xautolock -time 10 -locker blurlock
exec --no-startup-id sleep 1; blurlock; nextcloud

# Libinput touchpad controls
exec --no-startup-id xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1
# }}}


# --- vim settings ---
# vim:foldmethod=marker:foldlevel=0:filetype=i3
