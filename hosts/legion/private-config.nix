{ config, pkgs, lib, ... }:

{
    home.homeDirectory = "/home/umut";
    
    sops = {
        age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
        defaultSopsFile = ../../secrets/secrets.yaml;
    
        secrets = {
            "ssh_github_email" = {};
            "ssh_github_identity" = {};
            "ssh_hetzner_host" = {};
            "ssh_hetzner_identity" = {};
            "ssh_hetzner_user" = {};
            "git_username" = {};
            "git_email" = {};
        };
    };

    # Ensure the secrets directory exists
    home.file.".config/sops/secrets/.keep".text = "";

    programs.ssh = {
        enable = true;
    };

    programs.git.enable = true;

    home.activation = {
        setupGitAndSSH = lib.hm.dag.entryAfter ["writeBoundary"] ''
            # Set up Git configuration
            $DRY_RUN_CMD ${pkgs.git}/bin/git config --global user.name "$(cat ${config.sops.secrets.git_username.path})"
            $DRY_RUN_CMD ${pkgs.git}/bin/git config --global user.email "$(cat ${config.sops.secrets.git_email.path})"

            # Set up SSH config safely
            $DRY_RUN_CMD mkdir -p ~/.ssh
            $DRY_RUN_CMD touch ~/.ssh/config.tmp
            $DRY_RUN_CMD chmod 600 ~/.ssh/config.tmp
            
            $DRY_RUN_CMD cat > ~/.ssh/config.tmp << EOF
            Host github.com
                IdentityFile $(cat ${config.sops.secrets.ssh_github_identity.path})

            Host hetzner
                Hostname $(cat ${config.sops.secrets.ssh_hetzner_host.path})
                IdentityFile $(cat ${config.sops.secrets.ssh_hetzner_identity.path})
                User $(cat ${config.sops.secrets.ssh_hetzner_user.path})
            EOF

            # Move the temporary file into place
            $DRY_RUN_CMD mv -f ~/.ssh/config.tmp ~/.ssh/config
            $DRY_RUN_CMD chmod 600 ~/.ssh/config
        '';
    };
}
