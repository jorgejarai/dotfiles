{
  plugins.bufferline = {
    enable = true;
    settings.options = {
      diagnostics = "nvim_lsp";
      diagnostics_indicator = {
        __raw = ''
          function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
              return ""
            end

            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end
        '';
      };
      separator_style = "slant";

      offsets = [
        {
          filetype = "snacks_layout_box";
          text = {
            __raw = ''
              function()
                return vim.fn.getcwd()
              end
            '';
          };
          highlight = "Directory";
          separator = true;
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
}
