{ pkgs, ... }:

{

    programs.fish = {
        enable = true;

        shellAbbrs = {
            l = "ls -lah";
            vim = "nvim";
            hs = "home-manager switch";
        };

        interactiveShellInit = ''
            set -g fish_greeting
            set -gx EDITOR nvim
            # Start SSH agent if it's not running
            if not set -q SSH_AUTH_SOCK
                eval (ssh-agent -c)
                set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
                set -Ux SSH_AGENT_PID $SSH_AGENT_PID
            end
        '';
        functions = {
            fish_user_key_bindings = "fzf_key_bindings";        
	sample_hosts = "
            set -l words $argv
            set -l count (count $words)
            set -l index (shuf -n 1 -i 1-$count)
            set -l chosen_word $words[$index]
            set -l words_str (string join ', ' $words)
            echo \"| $chosen_word | $words_str |\"
        ";
        };

        #loginShellInit = ''
        #    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        #        exec startx -- -keeptty
        #    end
        #'';

        # Run startx as a subprocess of the login shell
        # In rootles mode and save logs to ~/.local/share/xorg/Xorg.log
        loginShellInit = ''
            if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
                startx -- -keeptty >~/.xorg.log 2>&1
            end
        '';
    };

}
