{
  plugins.grug-far.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>G";
      action = ":GrugFar<CR>";
      options = {
        desc = "grug-far";
        silent = true;
      };
    }
  ];
}
