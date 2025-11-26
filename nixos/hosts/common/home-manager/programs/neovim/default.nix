{
  imports = [
    ./bufferline.nix
    ./gitsigns.nix
    ./lazygit.nix
    ./lsp.nix
    ./lualine.nix
    ./neotree.nix
    ./startup.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./undotree.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "latte";
      };
    };

    opts = {
      showmatch = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      tabstop = 4;
      softtabstop = 4;
      expandtab = true;
      shiftwidth = 4;
      autoindent = true;
      number = true;
      relativenumber = true;
      wildmode = "longest,list";
      cc = "80";
      clipboard = "unnamedplus";
      cursorline = true;
      termguicolors = true;
      timeoutlen = 300;
    };

    plugins = {
      web-devicons.enable = true;
      nvim-tree.enable = true;
      copilot-lua.enable = true;
      copilot-chat.enable = true;
      lazygit.enable = true;
      fzf-lua.enable = true;
      which-key.enable = true;
      indent-blankline.enable = true;
      todo-comments.enable = true;
    };

    withNodeJs = true;
    withPython3 = true;
  };
}
