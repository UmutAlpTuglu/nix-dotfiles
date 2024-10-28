{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    btop
    tree
    file
    curl
    wget
    ripgrep
    fd
    magic-wormhole
    zip
    unzip
    neofetch

    # To format disks
    dosfstools
  ];

  #programs.direnv.enable = true;

}
