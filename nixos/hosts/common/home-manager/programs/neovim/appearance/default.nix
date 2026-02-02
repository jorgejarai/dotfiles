{
  imports = [
    ./bufferline.nix
    ./lualine.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "latte";
    };
  };

  plugins = {
    gitsigns.enable = true;
    indent-blankline.enable = true;
    noice = {
      enable = true;
      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = false;
          "vim.lsp.util.stylize_markdown" = false;
          "cmp.entry.get_documentation" = true;
        };
        presets = {
          bottom_search = true;
        };
      };
    };
    web-devicons.enable = true;
  };
}
