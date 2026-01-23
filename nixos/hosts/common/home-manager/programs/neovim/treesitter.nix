{pkgs, ...}: {
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        folding.enable = true;
        indent.enable = true;
        highlight.enable = true;
      };
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    treesitter-textobjects = {
      enable = true;
      settings.select.enable = false;
    };
  };
}
