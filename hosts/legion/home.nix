{ config, pkgs, lib, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should manage.
    home.file = {
        ".xinitrc".source = ../../programs/X11/xinitrc.nix;
        ".bash_profile".source = ../../programs/bash_profile.nix;
    };

    home.language.base = "en_US.UTF-8";
    
    home = {
        username = "umut";
        homeDirectory = "/home/umut";
    };


    #home.sessionVariables = {
    #};

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "23.11";

    # set some environment variables that will ease usage of software
    # installed with nix on non-NixOS linux
    # (fixing local issues, settings XDG_DATA_DIRS, etc.):
    targets.genericLinux.enable = true;
    

    home.packages = with pkgs; [
    	
	    # paper
        zotero
        obsidian
        # entertainment
        spotify

        # administration
        openssh
        openconnect

        # X11 related
        xorg.xrandr
        xorg.xinput
        xclip 
        arandr

        # dev
        docker
        git-crypt
        age
        sops

        # browser

        pulsemixer
        xfce.thunar
        brightnessctl
        vscode
        teams-for-linux

        imagemagick

        # Fonts
        terminus-nerdfont

        nixgl.nixGLIntel
    ];
    
    # workaround for the moment with ssh config sop setup
    home.activation = {
        removeConflictingFiles = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
            rm -f ~/.ssh/config
        '';
    };

    
    
    imports = [
        ./private-config.nix
        ../../programs/stylix.nix
        ../../programs/base-cli.nix
        ../../programs/base-gui.nix
        ../../programs/polybar.nix
        ../../programs/tmux.nix
        ../../programs/rofi.nix
        ../../programs/firefox.nix
        ../../programs/X11/xsession.nix
        ../../programs/X11/fish_x.nix
        #../../programs/alacritty.nix
        ../../programs/thunderbird.nix
        ../../programs/neovim.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.ssh = {
        enable = true;
    };

    programs.feh.enable = true;

    services.flameshot = {
        enable = true;
    };

    services.ssh-agent = {
        enable = true;
    };


    xdg = {
        userDirs = {
            extraConfig = {
                XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/.local/share/archive";
                XDG_SHARE_DIR = "${config.xdg.userDirs.documents}/shared/";
                XDG_WALLPAPER_DIR = "${config.xdg.userDirs.pictures}/wallpaper";
                XDG_NOTES_DIR = "${config.xdg.userDirs.documents}/notes/";
                XDG_TOOL_DIR = "${config.xdg.userDirs.documents}/tools/";
                XDG_VIRTUALBOX_VM_DIR = "${config.home.homeDirectory}/virtualboxVM";
                XDG_LINUX_VM_DIR = "${config.xdg.userDirs.documents}/shared/linux_vm";
                XDG_WINDOWS_VM_DIR = "${config.xdg.userDirs.documents}/shared/windows_vm";
                XDG_RDP_DIR = "${config.xdg.userDirs.documents}/shared/rdp";
            };
        };
    };

}
