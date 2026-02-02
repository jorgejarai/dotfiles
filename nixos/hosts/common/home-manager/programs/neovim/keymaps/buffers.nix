{
  keymaps = [
    {
      mode = "n";
      key = "<leader>wh";
      action = ":split<CR>";
      options = {
        desc = "Horizontal split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wv";
      action = ":vsplit<CR>";
      options = {
        desc = "Vertical split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wm";
      action = "<C-w>_<C-w>|";
      options = {
        desc = "Maximize panel";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>we";
      action = "<C-w>=";
      options = {
        desc = "Equalize panels";
        silent = true;
      };
    }
  ];
}
