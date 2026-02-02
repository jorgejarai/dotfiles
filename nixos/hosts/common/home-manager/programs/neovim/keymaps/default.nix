{
  imports = [
    ./buffers.nix
    ./lsp.nix
    ./smart-splits.nix
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>us";
      action = '':let @/ = ""<cr>'';
      options = {
        desc = "Clear Search";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>W";
      action = ":set wrap!<cr>";
      options = {
        desc = "Toggle Wrap";
        silent = true;
      };
    }
  ];
}
