{ pkgs, ... }:

{

    programs.tmux = {
        enable = true;
        escapeTime = 10;
        mouse = true;
        prefix = "C-f";
        #shell = "${pkgs.fish}/bin/fish";
        terminal = "screen-256color";
        keyMode = "vi";
        extraConfig = ''
            set-option -s set-clipboard off
            bind P paste-buffer
            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi y send-keys -X rectangle-toggle
            unbind -T copy-mode-vi Enter
            bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'xclip -se c -i'
            bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'xclip -se c -i'
        '';
    };
}

