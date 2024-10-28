{ pkgs, ... }:

let
    i3 = {
        modifier = "Mod4";
        workspaces = {
           ws1 = "1";
           ws2 = "2";
           ws3 = "3";
           ws4 = "4";
           ws5 = "5";
           ws6 = "6";
           ws7 = "7";
           ws8 = "8";
           ws9 = "9";
           ws10 = "10";
        };
        # This is not allowed to be a pkgs link (${pkgs.alacritty})
        # Otherwise alacritty wont start using the i3 shortcut
        terminal = "alacritty";
        menu = "${pkgs.rofi}/bin/rofi -show drun";
        screenshot = "${pkgs.flameshot}/bin/flameshot gui";
        screenlock = "i3lock -c 000000";
        calculator = "${pkgs.rofi}/bin/rofi -show calc";
        browser = "${pkgs.firefox}/bin/firefox";
        colors = {
            mainColor = "#7b2980";
        };
    };

in


{
    xsession = {
        enable = true;
        # This is written in ~/.xsession
        initExtra = with pkgs; ''
            # This section of ~/.xsession is managed by Home-Manager

            # Set keymap to german
            #setxkbmap de

            # End of section
        '';
        windowManager.i3 = {
            enable = true;
            #package = pkgs.i3-gaps;
            config = rec {
                modifier = i3.modifier;
                bars = [ ];
                #colors = {
                    #background = "#F8F8F2";
                    #focused = {
                        #background = i3.colors.mainColor;
                        #border = i3.colors.mainColor;
                        #childBorder = i3.colors.mainColor;
                        #indicator = i3.colors.mainColor;
                        #text = "#ffffff";
                    #};
                    #unfocused = {
                        #background = "#282A36";
                        ##border = "#282A36";
                        ##childBorder = "#282A36";
                        ##indicator = "#282A36";
                        ##text = "#BFBFBF";
                    ##};
                    ##urgent = {
                        ##background = "#FF5555";
                        ##border = "#44475A";
                        ##childBorder = "#FF5555";
                        ##indicator = "#FF5555";
                        ##text = "#F8F8F2";
                    ##};
                ##};

                gaps = {
                    inner = 6;
                    outer = 0;
                    smartGaps = false;
                    smartBorders = "off";
                };

                startup = [
                    # Set Workspace 0 on startup
                    {
                        command = "i3-msg workspace 1";
                        always = true;
                        notification = false;
                    }
                    # Set background image
                    {
                        command = "feh --bg-fill ~/dotfiles/general/images/wallpaper/wallpaper.jpg";
                        always = true;
                        notification = false;
                    }
                    ## Set keymap to german
                    {
                        command = "setxkbmap de";
                        always = true;
                        notification = false;
                    }
                    # Enable Polybar
                    #{
                    #    command = "systemctl --user restart polybar.service";
                    #    always = true;
                    #    notification = false;
                    #}
                    # Enable i3lock
                    {
                        command = "xss-lock --transfer-sleep-lock -- i3lock --nofork";
                        always = true;
                        notification = false;
                    }
                ];

                keybindings = import ./i3-keybindings.nix i3;
            };
        };
    };
}
