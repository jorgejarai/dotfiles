{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        size = 20;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>ToggleTerm direction=float<cr>";
        options = {
          desc = "Toggle terminal";
        };
      }
    ];
  };
}
