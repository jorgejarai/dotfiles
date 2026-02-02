{
  plugins.flash.enable = true;

  keymaps = [
    {
      mode = ["n" "x"];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
      options = {
        silent = true;
        desc = "Flash";
      };
    }
  ];
}
