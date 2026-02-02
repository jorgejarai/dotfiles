{
  plugins.spider = {
    enable = true;

    settings = {
      subwordMovement = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "w";
      action = "<cmd>lua require('spider').motion('w')<CR>";
    }
    {
      mode = "n";
      key = "b";
      action = "<cmd>lua require('spider').motion('b')<CR>";
    }
    {
      mode = "n";
      key = "e";
      action = "<cmd>lua require('spider').motion('e')<CR>";
    }
    {
      mode = "n";
      key = "ge";
      action = "<cmd>lua require('spider').motion('ge')<CR>";
    }
  ];

  extraConfigLua = ''
    require('spider').setup()
  '';
}
