{
  programs.nixvim = {
    imports = [
      ./appearance
      ./cmp.nix
      ./conform.nix
      ./keymaps
      ./lsp.nix
      ./smart-splits.nix
      ./snacks.nix
      ./telescope.nix
      ./treesitter.nix
      ./undotree.nix
    ];

    enable = true;
    enableMan = true;

    globals.mapleader = " ";

    opts = {
      backup = false;
      showmatch = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      shiftwidth = 2;
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
      comment.enable = true;
      copilot-chat.enable = true;
      copilot-lua.enable = true;
      fzf-lua.enable = true;
      lazygit.enable = true;
      mini-ai = {
        enable = true;
        settings = {
          custom_textobjects = {
            f = {
              __raw = "require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' })";
            };
            c = {
              __raw = "require('mini.ai').gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' })";
            };
          };
        };
      };
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      schemastore.enable = true;
      spectre.enable = true;
      spider.enable = true;
      undotree.enable = true;
      which-key.enable = true;
    };

    autoCmd = [
      {
        event = ["FileType"];
        pattern = [
          "c"
          "cpp"
          "python"
          "json"
          "yaml"
        ];
        callback = {
          __raw = ''
            function()
              vim.opt_local.tabstop = 4
              vim.opt_local.shiftwidth = 4
              vim.opt_local.softtabstop = 4
            end
          '';
        };
      }
    ];

    withNodeJs = true;
    withPython3 = true;
  };
}
