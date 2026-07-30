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
      options.desc = "Spider: Forward word";
    }
    {
      mode = "n";
      key = "b";
      action = "<cmd>lua require('spider').motion('b')<CR>";
      options.desc = "Spider: Backward word";
    }
    {
      mode = "n";
      key = "e";
      action = "<cmd>lua require('spider').motion('e')<CR>";
      options.desc = "Spider: End of word";
    }
    {
      mode = "n";
      key = "ge";
      action = "<cmd>lua require('spider').motion('ge')<CR>";
      options.desc = "Spider: Backward end of word";
    }
  ];

  extraConfigLua = ''
    require('spider').setup()
  '';
}
