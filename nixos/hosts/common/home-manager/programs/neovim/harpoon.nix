{
  plugins.harpoon = {
    enable = true;

    enableTelescope = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = ''
        function()
          require("harpoon"):list():add()
        end
      '';
      options.desc = "Harpoon: Add file";
    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = ''
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      '';
      options.desc = "Harpoon: Quick menu";
    }
    {
      mode = "n";
      key = "<A-1>";
      action.__raw = ''function() require("harpoon"):list():select(1) end'';
      options.desc = "Harpoon: Go to file 1";
    }
    {
      mode = "n";
      key = "<A-2>";
      action.__raw = ''function() require("harpoon"):list():select(2) end'';
      options.desc = "Harpoon: Go to file 2";
    }
    {
      mode = "n";
      key = "<A-3>";
      action.__raw = ''function() require("harpoon"):list():select(3) end'';
      options.desc = "Harpoon: Go to file 3";
    }
    {
      mode = "n";
      key = "<A-4>";
      action.__raw = ''function() require("harpoon"):list():select(4) end'';
      options.desc = "Harpoon: Go to file 4";
    }
  ];
}
