{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ca";
      action = ":Lspsaga code_action<CR>";
      options = {
        desc = "Code Action";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "K";
      action = ":Lspsaga hover_doc<CR>";
      options = {
        desc = "Hover Documentation";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>l";
      action = {
        __raw = ''
          require("lsp_lines").toggle
        '';
      };
      options = {
        desc = "Toggle lsp_lines";
        silent = true;
      };
    }
  ];
}
