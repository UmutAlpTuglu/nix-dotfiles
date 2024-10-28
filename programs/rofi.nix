{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        plugins = [
            pkgs.rofi-calc
        ];
        extraConfig = {
            show-icons = true;
        };
    };
}
