{ config, pkgs, lib, ... }:

{

    programs.alacritty = {
        enable = true;
        settings = {
            shell = {
                program = "${pkgs.fish}/bin/fish";
            };
        };

        # This nixgl script needs to be formatted exaclty like this
        package = pkgs.writeShellScriptBin "alacritty2" ''
            #!/bin/sh

            ${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel ${pkgs.alacritty}/bin/alacritty "$@"
         '';
    };

}
