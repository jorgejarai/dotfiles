{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        theme = "catppuccin";
        extensions = [
          "fzf"
          "neo-tree"
        ];
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            icon = "";
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";
            sources = ["nvim_lsp"];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          }
          {
            __unkeyed-1 = "navic";
          }
          {
            __unkeyed-1.__raw = ''
              function()
                local recording = vim.fn.reg_recording() ~= ""
                if not recording then
                  return ""
                end
                return "󰑊 @" .. vim.fn.reg_recording()
              end,
              color = {fg = "#fe640b"}
            '';
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
          }
          {
            __unkeyed-1.__raw = ''
              function()
                  local icon = " "
                  local status = require("copilot.api").status.data
                  return icon .. (status.message or " ")
              end,

              cond = function()
                local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
                return ok and #clients > 0
              end,
            '';
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "progress";
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
          }
        ];
      };
    };
  };
}
