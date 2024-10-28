{ pkgs, ... }:
let
  icons = {
    terminal = "";
    cpu = "";
    memory = "";
    date = "";
    microphone = "";
    microphone-muted = "";
    microphone-disconnected = "";
    wifi = "";
    up = "";
    down = "";
    ethernet = "";
    envelope = "";
  };

in {
  services = {
    polybar = {
      enable = true;

      package = pkgs.polybar.override {
        alsaSupport = true;
        githubSupport = true;
        mpdSupport = true;
        pulseSupport = true;
        i3Support = true;
      };

      #script = "${pkgs.polybar}/bin/polybar -q -r main";

      script = ''
            for m in $(${pkgs.polybar}/bin/polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
                echo "hi" >> /tmp/test
                MONITOR=$m polybar main &
            done
       '';

      config = let
        background = "#282A36";
        alert = "#ff3300";
        background-alt = "#99000000";

        foreground = "#ffdddddd";
        foreground-alt = "#ffdddddd";

        primary = "#7b2980";
        secondary = "#ff003333";

        fonts = {
          #font-0 = "Tamsyn:pixelsize=12;0";
          #font-1 = "unifont:fontformat=truetype:size=8:antialias=true;0";
          #font-2 = "Envy Code R:pixelsize=10;0";
          #font-3 = "Font Awesome 5 Free:style=Regular:pixelsize=10;1";
          #font-4 = "Font Awesome 5 Free:style=Solid:pixelsize=10;1";
          #font-5 = "Font Awesome 5 Brands:pixelsize=10;1";
          
        };
      in {
        "bar/main" =  {
          monitor = "\${env:MONITOR:}";
          height = 22;
          radius = 0;
          fixed-center = true;
          top = true;

          # Text Fonts
          # font-N = <fontconfig pattern>;<vertical offset>
          font-0 = "Terminess Nerd Font Propo:style=Bold:size=10:antialias=true;2";
          # Icons Fonts
          #font-1 = "NotoColorEmoji:size=8;0";
          #font-1 = "Terminess Nerd Font Mono:fontformat=truetype:size=30:antialias=true;0";
          #font-1 = "Terminess Nerd Font Mono:fontformat=truetype:size=12:antialias=true;0";
          # Powerline Glyphs
          #font-2 = "Iosevka Nerd Font:style=Medium:size=22;3";
          # Larger font size for bar fill icons
          #font-3 = "Iosevka Nerd Font:style=Medium:size=18;3";
          # Smaller font size for shorter spaces
          #font-4 = "Iosevka Nerd Font:style=Medium:size=13;3";

          background = background;
          #foreground = foreground;

          separator = "|";

          module-margin = 1;


          #line-size = 2;
          #line-color = "#f00";

          #border-size = 0;

          #padding-left = 0;
          #padding-right = 0;

          module-padding = 10;
          #module-margin-left = 1;
          #module-margin-right = 1;

          modules-left = "i3";
          #modules-center = "xwindow";
          modules-right = "wlan eth volume cpu memory filesystem temperature battery date time";

          tray-position = "right";
          #tray-padding = 6;

          scroll-up = "#i3.next";
          scroll-down = "#i3.prev";
        };

        #"settings" = {
          #screenchange-reload = "true";
          #pseudo-transparency = true;
        #};

        #"global/wm" = {
        #  margin-top = 2;
        #  margin-bottom = 2;
        #};

        "module/xwindow" = {
          type = "internal/xwindow";
          label = "%title:0:30:...%";
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;

          #format-prefix-foreground = primary;
          #format-underline = "#07ACFF";
          format = "<label>";
          label = "%percentage%%";
          format-prefix = " ";

          ramp-coreload-0 = "▁";
          ramp-coreload-1 = "▂";
          ramp-coreload-2 = "▃";
          ramp-coreload-3 = "▄";
          ramp-coreload-4 = "▅";
          ramp-coreload-5 = "▆";
          ramp-coreload-6 = "▇";
          ramp-coreload-7 = "█";
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 2;

          format-prefix = " ";
          #format-prefix-foreground = primary;
          label = "%gb_used%/%gb_total%";
        };

        "module/i3" = {
          type = "internal/i3";
          format = "<label-state> <label-mode>";
          index-sort = true;
          wrapping-scroll = false;

          # Only show workspaces on the same output as the bar
          pin-workspaces = true;

          ws-icon-0 = "1;1";
          ws-icon-1 = "2;2";
          ws-icon-2 = "3;3";
          ws-icon-3 = "4;4";
          ws-icon-4 = "5;5";
          ws-icon-5 = "6;6";
          ws-icon-6 = "7;7";
          ws-icon-7 = "8;8";
          ws-icon-8 = "9;9";
          ws-icon-9 = "10;10";

          #label-mode-padding = 1;
          #label-mode-foreground = "#000";
          label-mode-background = primary;

          # focused = "Active workspace on focused monitor";
          label-focused = "%icon%";
          label-focused-background = primary;
          label-focused-foreground = "#000000";
          label-focused-padding = 1;

          # unfocused = "Inactive workspace on any monitor";
          label-unfocused = "%icon%";
          #label-unfocused-background = background;
          label-unfocused-padding = 1;

          # visible = "Active workspace on unfocused monitor";
          label-visible = "%icon%";
          #label-visible-background = secondary;
          label-visible-padding = 1;

          # urgent = "Workspace with urgency hint set";
          label-urgent = "%icon%";
          label-urgent-background = alert;
          label-urgent-padding = 1;

          label-separator = "|";
          label-separator-padding = 0;
          #label-separator-foreground = "#ffb52a";
        };

        "module/filesystem" = {
          type = "internal/fs";
          interval = 10;

          mount-0 = "/";

          #format-mounted-underline = "#06E87A";
          label-mounted = " %used%/%total% (%percentage_used%%)";
        };

        "module/volume" = {
          type = "internal/volume";
          label-volume = " %percentage%%";
          #label-volume-foreground = primary;

          label-muted = " %percentage%%";
          #label-muted-foreground = #666

          click-right = "alacritty -e pulsemixer";

          #format-muted-prefix = " ";
          #format-muted-foreground = primary;
          #label-muted = "sound muted";

          bar-volume-width = "10";
          #bar-volume-foreground-0 = "#55aa55";
          #bar-volume-foreground-1 = "#55aa55";
          #bar-volume-foreground-2 = "#55aa55";
          #bar-volume-foreground-3 = "#55aa55";
          #bar-volume-foreground-4 = "#55aa55";
          #bar-volume-foreground-5 = "#f5a70a";
          #bar-volume-foreground-6 = "#ff5555";
          bar-volume-gradient = true;
          bar-volume-indicator = "|";
          bar-volume-indicator-font = "1";
          bar-volume-fill = "─";
          bar-volume-fill-font = "1";
          bar-volume-empty = "─";
          bar-volume-empty-font = "1";
          #bar-volume-empty-foreground = foreground-alt;
        };

        "module/eth" = {
          type = "internal/network";
          interval = "3.0";
          interface-type = "wired";

          #format-connected-underline = "#06FFCC";
          #format-disconnected-underline = "#06FFCC";
          #format-connected-prefix-foreground = foreground-alt;
          label-connected =
            "󰈀(%ifname%): %local_ip% %local_ip6%";

          # format-disconnected = "<label-disconnected>";
          # label-disconnected = "";
          # label-disconnected-foreground = foreground-alt;
        };

        "module/wlan" = {
          type = "internal/network";
          interval = "3.0";
          interface-type = "wireless";

          #format-connected = "<label-connected>";
          label-connected =
            "󰖩(%essid%): %local_ip% %local_ip6% (%signal%)";

          ramp-signal-0 = "▁";
          ramp-signal-1 = "▂";
          ramp-signal-2 = "▃";
          ramp-signal-3 = "▄";
          ramp-signal-4 = "▅";
          ramp-signal-5 = "▆";
          ramp-signal-6 = "▇";
          ramp-signal-7 = "█";
          #ramp-signal-foreground = foreground-alt;
        };

        "module/date" = {
          type = "internal/date";
          interval = "5";

          date = "%Y-%m-%d-%a";
          date-alt = "%Y-%m-%d-%a";

          #format-underline = "#2406E8";
          label = "%date%";
        };

        "module/time" = {
          type = "internal/date";
          interval = "1";

          date = "%a %b %d";
          date-alt = "%Y-%m-%d";

          time = "%H:%M:%S %p";
          time-alt = "%H:%M:%S %p";

          #format-underline = "#2406E8";
          label = "%time%";
        };

        "module/temperature" = {
          type = "internal/temperature";
          thermal-zone = "0";

          #format-underline = "#0561E8";
          format = "<ramp> <label>";
          #format-warn-underline = "#0561E8";
          format-warn = "<ramp> <label-warn>";

          label = "%temperature-c%";
          
          warn-temperature = "60";
          label-warn = "%temperature-c%";
          label-warn-foreground = "#FFFC00";

          ramp-0 = "";
          ramp-1 = "";
          ramp-2 = "";
          #ramp-foreground = primary;
        };

        "module/xkeyboard" = {
          type = "internal/xkeyboard";
          blacklist-0 = "num lock";

          format-prefix = " ";
          #format-prefix-foreground = foreground-alt;

          label-layout = "%layout%";

          label-indicator-padding = "2";
          label-indicator-margin = "1";
          #label-indicator-background = secondary;
        };

        "module/xbacklight" = {
          type = "internal/xbacklight";

          format = "<label> <bar>";
          label = "BL";

          bar-width = "10";
          bar-indicator = "|";
          #bar-indicator-foreground = "#ff";
          #bar-indicator-font = "2";
          bar-fill = "─";
          #bar-fill-font = "2";
          #bar-fill-foreground = "#9f78e1";
          bar-empty = "─";
          bar-empty-font = "2";
          #bar-empty-foreground = foreground-alt;
        };

        "module/backlight-acpi" = {
          "inherit" = "module/xbacklight";
          type = "internal/backlight";
          card = "intel_backlight";
        };

        "module/battery" = {
          type = "internal/battery";
          poll-interval = "2";
          battery = "BAT0";
          adapter = "AC";
          time-format = "%H:%M";

          # Prefix first works but then suddenly not. Idk...
          #label-charging-prefix = "";
          #label-charging-prefix-foreground = foreground;
          format-charging = "<animation-charging> <label-charging>";
          label-charging = "%percentage%% (%time% %consumption%W)";

          format-discharging = "<ramp-capacity> <label-discharging>";
          label-discharging = "%percentage%% (%time%)";

          full-at = "100";
          format-full = "<label-full>";
          label-full = "100%";
          #format-full-prefix-foreground = foreground;

          low-at = "30";
          format-low = "<label-low>";
          label-low = "%percentage%% (%time%)";
          label-low-foreground = alert;

          ramp-capacity-0 = "";
          ramp-capacity-1 = "";
          ramp-capacity-2 = "";
          ramp-capacity-3 = "";
          ramp-capacity-4 = "";
          #ramp-capacity-foreground = primary;

          animation-charging-0 = "";
          animation-charging-1 = "";
          animation-charging-2 = "";
          animation-charging-3 = "";
          animation-charging-4 = "";
          #animation-charging-foreground = primary;
          animation-charging-framerate = "750";
        };

        "module/powermenu" = {
          type = "custom/menu";

          format-spacing = "1";

          label-open = "";
          label-open-foreground = secondary;
          label-close = " cancel";
          label-close-foreground = secondary;
          label-separator = "|";
          label-separator-foreground = foreground-alt;

          menu-0-0 = "reboot";
          menu-0-0-exec = "menu-open-1";
          menu-0-1 = "power off";
          menu-0-1-exec = "menu-open-2";

          menu-1-0 = "cancel";
          menu-1-0-exec = "menu-open-0";
          menu-1-1 = "reboot";
          menu-1-1-exec = "systemctl reboot";

          menu-2-0 = "power off";
          menu-2-0-exec = "systemctl poweroff";
          menu-2-1 = "cancel";
          menu-2-1-exec = "menu-open-0";
        };

        "module/headsetswitch" = let
          pactl = "/usr/bin/pactl";
          grep = "${pkgs.gnugrep}/bin/grep";
          sed = "${pkgs.gnused}/bin/sed";
        in {
          type = "custom/script";
          format-underline = "#0628FF";
          label = "%output%";
          exec = __concatStringsSep " " [
            "${pactl} info"
            "| ${grep} 'Default Sink'"
            "| ${sed} 's/.*analog-stereo//'"
            "| ${sed} 's/.*analog-stereo//'"
            "| ${sed} 's/.*auto_null/${icons.microphone-disconnected}/'"
            "| ${sed} 's/.*hdmi-stereo-extra.*/HDMI/'"
            "| ${sed} 's/.*headset_head_unit/${icons.microphone}/'"
            "| ${sed} 's/.*a2dp_sink/${icons.microphone-muted}/'"
            "| ${sed} 's/.*hdmi-stereo/HDMI/'"
          ];

          tail = true;
          interval = 2;
          click-left =
            "${pactl} set-card-profile bluez_card.64_BC_58_17_35_62 a2dp_sink";
          click-right =
            "${pactl} set-card-profile bluez_card.64_BC_58_17_35_62 headset_head_unit";
        };


      };
    };
  };
}

