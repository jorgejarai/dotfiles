{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings.options = {
        close_icon = " ";
        buffer_close_icon = "󰱝 ";
        modified_icon = "󰔯 ";

        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };

    keymaps = [
      {
        key = "H";
        action = "BufferLineCyclePrev";
        options.desc = "Go to previous buffer";
      }
      {
        key = "L";
        action = "BufferLineCycleNext";
        options.desc = "Go to next buffer";
      }
      {
        key = "<leader>bd";
        action = "BufferLinePickClose";
        options.desc = "Delete buffer";
      }
    ];
  };
}
