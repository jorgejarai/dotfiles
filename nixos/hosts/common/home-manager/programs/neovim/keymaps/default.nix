{
  imports = [
    ./tabs.nix
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>rs";
      action = ":Spectre<CR>";
      options = {
        desc = "Spectre toggle";
        silent = true;
      };
    }
  ];
}
