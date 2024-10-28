i3:
{
    # Open program
    "${i3.modifier}+Return" 	    = "exec --no-startup-id ${i3.terminal} -e tmux";
    "${i3.modifier}+Shift+Return"   = "exec --no-startup-id ${i3.terminal}";
    "${i3.modifier}+d"              = "exec --no-startup-id ${i3.menu}";
    "${i3.modifier}+c"              = "exec --no-startup-id ${i3.screenshot}";
    "${i3.modifier}+b"              = "exec --no-startup-id ${i3.browser}";
    "${i3.modifier}+i"              = "exec --no-startup-id ${i3.terminal} -e btop";
    "${i3.modifier}+v"              = "exec --no-startup-id ${i3.calculator}";
    "${i3.modifier}+Shift+s"        = "exec --no-startup-id ${i3.terminal} -e pulsemixer";
    "${i3.modifier}+Shift+b"        = "exec --no-startup-id ${i3.terminal} -e bluetoothctl";
    "${i3.modifier}+Shift+x"        = "exec --no-startup-id ${i3.screenlock}";
    "${i3.modifier}+Shift+q"        = "kill";
    
    # i3 general
    "${i3.modifier}+Shift+r"        = "restart";
    "${i3.modifier}+Shift+e"        = "exec --no-startup-id i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'";

    # Change Display Brightness
    "XF86MonBrightnessUp"           = "exec --no-startup-id brightnessctl set +5%";
    "XF86MonBrightnessDown"         = "exec --no-startup-id brightnessctl set 5%-";

    # Change Audio Volume
    "XF86AudioRaiseVolume"          = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
    "XF86AudioLowerVolume"          = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
    "XF86AudioMute"                 = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
    "XF86AudioMicMute"              = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";


    # Change focus
    "${i3.modifier}+Left"  = "focus left";
    "${i3.modifier}+Down"  = "focus down";
    "${i3.modifier}+Up"    = "focus up";
    "${i3.modifier}+Right" = "focus right";

    # Change focus (alternative)
    "${i3.modifier}+h"  = "focus left";
    "${i3.modifier}+j"  = "focus down";
    "${i3.modifier}+k"    = "focus up";
    "${i3.modifier}+l" = "focus right";

    # Move focused window
    "${i3.modifier}+Shift+Left"  = "move left";
    "${i3.modifier}+Shift+Down"  = "move down";
    "${i3.modifier}+Shift+Up"    = "move up";
    "${i3.modifier}+Shift+Right" = "move right";

    # Move focused window (alternative)
    "${i3.modifier}+Shift+h"  = "move left";
    "${i3.modifier}+Shift+j"  = "move down";
    "${i3.modifier}+Shift+k"    = "move up";
    "${i3.modifier}+Shift+l" = "move right";

    # Move focused window (additional)
    "${i3.modifier}+a" = "focus parent";

    # Change window orientation
    "${i3.modifier}+m" = "splith";
    "${i3.modifier}+n" = "splitv";

    # Change container layout
    "${i3.modifier}+s" = "layout stacking";
    "${i3.modifier}+t" = "layout tabbed";
    "${i3.modifier}+w" = "layout toggle split";


    #"${i3.modifier}+Control+Left"  = "resize shrink width  ${sway.amounts.resize}";
    #"${i3.modifier}+Control+Down"  = "resize grow   height ${sway.amounts.resize}";
    #"${i3.modifier}+Control+Up"    = "resize shrink height ${sway.amounts.resize}";
    #"${i3.modifier}+Control+Right" = "resize grow   width  ${sway.amounts.resize}";

    # Switch to workspace
    "${i3.modifier}+1" = "workspace ${i3.workspaces.ws1}";
    "${i3.modifier}+2" = "workspace ${i3.workspaces.ws2}";
    "${i3.modifier}+3" = "workspace ${i3.workspaces.ws3}";
    "${i3.modifier}+4" = "workspace ${i3.workspaces.ws4}";
    "${i3.modifier}+5" = "workspace ${i3.workspaces.ws5}";
    "${i3.modifier}+6" = "workspace ${i3.workspaces.ws6}";
    "${i3.modifier}+7" = "workspace ${i3.workspaces.ws7}";
    "${i3.modifier}+8" = "workspace ${i3.workspaces.ws8}";
    "${i3.modifier}+9" = "workspace ${i3.workspaces.ws9}";
    "${i3.modifier}+0" = "workspace ${i3.workspaces.ws10}";

    # Move container to workspace
    "${i3.modifier}+Shift+1" = "move container to workspace ${i3.workspaces.ws1}";
    "${i3.modifier}+Shift+2" = "move container to workspace ${i3.workspaces.ws2}";
    "${i3.modifier}+Shift+3" = "move container to workspace ${i3.workspaces.ws3}";
    "${i3.modifier}+Shift+4" = "move container to workspace ${i3.workspaces.ws4}";
    "${i3.modifier}+Shift+5" = "move container to workspace ${i3.workspaces.ws5}";
    "${i3.modifier}+Shift+6" = "move container to workspace ${i3.workspaces.ws6}";
    "${i3.modifier}+Shift+7" = "move container to workspace ${i3.workspaces.ws7}";
    "${i3.modifier}+Shift+8" = "move container to workspace ${i3.workspaces.ws8}";
    "${i3.modifier}+Shift+9" = "move container to workspace ${i3.workspaces.ws9}";
    "${i3.modifier}+Shift+0" = "move container to workspace ${i3.workspaces.ws10}";

    # Move workspace to output
    "${i3.modifier}+Shift+period" = "move workspace to output right";
    "${i3.modifier}+Shift+comma" = "move workspace to output left";

    "${i3.modifier}+f" = "fullscreen";




    "${i3.modifier}+space"       = "focus mode_toggle";
    "${i3.modifier}+Shift+space" = "floating toggle";

}
