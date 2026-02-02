{
  plugins = {
    hardtime = {
      enable = true;

      settings.disabled_keys = {
        "<Up>" = [""];
        "<Down>" = [""];
        "<Left>" = [""];
        "<Right>" = [""];
      };
    };
    precognition.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>p";
      action = ":Precognition toggle<CR>";
      options = {
        desc = "Toggle precognition";
        silent = true;
      };
    }
  ];
}
