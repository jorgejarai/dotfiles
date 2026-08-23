{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.snipe-nvim];

  extraConfigLua = ''
    require('snipe').setup()
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>lua require('snipe').open_buffer_menu()<CR>";
      options = {
        silent = true;
        desc = "Snipe: Buffer menu";
      };
    }
  ];
}
