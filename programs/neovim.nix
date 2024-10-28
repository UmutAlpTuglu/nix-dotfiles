{ pkgs, ... }:

{

    programs.neovim = {
        enable = true;

        extraConfig = ''
            syntax enable
            set tabstop=4
            set shiftwidth=4
            set softtabstop=4
            set expandtab
            set clipboard+=unnamedplus
        '';

        coc = {
            enable = true;
        };

        plugins = with pkgs.vimPlugins; [
            vim-colorschemes
            LazyVim
            vim-airline
            {
                plugin = vim-airline-themes;
                config = "let g:airline_theme = \"badwolf\" \n let g:airline_powerline_fonts = 1";
            }

            ultisnips
            vim-snippets
        ];

    };

}
