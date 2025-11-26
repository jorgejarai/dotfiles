{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };

    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep find";
      };
      "<leader>b" = {
        action = "buffers";
        options.desc = "Find open buffers";
      };
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Find help tags";
      };
    };
  };
}
