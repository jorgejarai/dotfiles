{
  programs.nixvim = {
    imports = [
      ./appearance
      ./keymaps

      ./blink.nix
      ./conform.nix
      ./copilot.nix
      ./flash.nix
      ./grug-far.nix
      ./hardtime.nix
      ./lsp.nix
      ./snacks.nix
      ./spider.nix
      ./telescope.nix
      ./treesitter.nix
      ./undotree.nix
    ];

    enable = true;
    enableMan = true;

    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    opts = {
      backup = false;
      showmatch = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      tabstop = 4;
      softtabstop = 4;
      autoindent = true;
      smartindent = true;
      expandtab = true;
      shiftwidth = 4;
      number = true;
      relativenumber = true;
      wildmode = "longest,list";
      cc = "80";
      clipboard = "unnamedplus";
      cursorline = true;
      termguicolors = true;
      timeoutlen = 300;
      undofile = true;
    };

    plugins = {
      comment.enable = true;
      direnv.enable = true;
      fzf-lua.enable = true;
      gitblame.enable = true;
      lazygit.enable = true;
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      schemastore.enable = true;
      smart-splits.enable = true;
      smear-cursor.enable = true;
      undotree.enable = true;
      which-key.enable = true;
    };

    userCommands = {
      "W".command = "w";
      "Q" = {
        command = "q";
        bang = true;
      };
      "Wq" = {
        command = "wq";
        bang = true;
      };
      "Wa".command = "wa";
      "Qa" = {
        command = "qa";
        bang = true;
      };
    };

    autoCmd = [
      {
        event = ["FileType"];
        pattern = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "nix"
        ];
        callback = {
          __raw = ''
            function()
              vim.opt_local.tabstop = 2
              vim.opt_local.shiftwidth = 2
              vim.opt_local.softtabstop = 2
            end
          '';
        };
      }
      {
        event = ["TextYankPost"];
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        };
      }
    ];

    withNodeJs = true;
    withPython3 = true;
  };
}
