{
  plugins.yazi = {
    enable = true;

    settings = {
      enable_mouse_support = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>y";
      action = "<cmd>Yazi<CR>";
      options.desc = "Yazi: File manager";
    }
  ];
}
