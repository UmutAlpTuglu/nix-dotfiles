{ pkgs, ... }:

{
    stylix = {
        #provide wallpaper location here
        image = ../general/images/wallpaper/wallpaper.jpg;
        fonts.sizes.desktop = 10;
        fonts.sizes.applications = 10;
        #fonts.sizes.terminal = 10;
        cursor.size = 16;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/darktooth.yaml";
        autoEnable = false;
        targets = {
            # Do not enable fish here - it causes long loading times when opening a new shell
            #fish.enable = true;
            tmux.enable = true;
            alacritty.enable = true;
            vim.enable = true;
            firefox.enable = true;
            rofi.enable = true;
            i3.enable = true;
            gtk.enable = true;
            feh.enable = true;
            fzf.enable = true;
            vscode.enable = true;
            # Do not enable kde here - it causes bugs for QT applications
            #kde.enable = true;
        };
    };
}
