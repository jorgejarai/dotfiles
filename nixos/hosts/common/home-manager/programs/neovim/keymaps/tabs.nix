{
  keymaps = [
    {
      mode = "n";
      key = "H";
      action = ":tabprevious<CR>";
      options = {
        desc = "Previous tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "L";
      action = ":tabnext<CR>";
      options = {
        desc = "Next tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wh";
      action = ":split<CR>";
      options = {
        desc = "Horizontal split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wv";
      action = ":vsplit<CR>";
      options = {
        desc = "Vertical split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wm";
      action = "<C-w>_<C-w>|";
      options = {
        desc = "Maximize panel";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>we";
      action = "<C-w>=";
      options = {
        desc = "Equalize panels";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = ":tabnew<CR>";
      options = {
        desc = "New tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t1";
      action = "1gt";
      options = {
        desc = "Go to tab 1";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t2";
      action = "2gt";
      options = {
        desc = "Go to tab 2";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t3";
      action = "3gt";
      options = {
        desc = "Go to tab 3";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t4";
      action = "4gt";
      options = {
        desc = "Go to tab 4";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t5";
      action = "5gt";
      options = {
        desc = "Go to tab 5";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t6";
      action = "6gt";
      options = {
        desc = "Go to tab 6";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t7";
      action = "7gt";
      options = {
        desc = "Go to tab 7";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t8";
      action = "8gt";
      options = {
        desc = "Go to tab 8";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t9";
      action = "9gt";
      options = {
        desc = "Go to tab 9";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t0";
      action = ":tablast<CR>";
      options = {
        desc = "Go to last tab";
        silent = true;
      };
    }
  ];
}
