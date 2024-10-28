{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    keepassxc
    libreoffice
    peek
    #swappy
    #wl-clipboard
  ];


  xdg.userDirs = {
    enable = true;

    createDirectories = true;

    desktop = "${config.home.homeDirectory}/desktop";
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";

    publicShare = null;
    templates = null;
  };
}
