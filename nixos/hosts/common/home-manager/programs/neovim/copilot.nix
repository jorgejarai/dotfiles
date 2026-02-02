{
  plugins = {
    copilot-chat.enable = true;
    copilot-lua.enable = true;
  };

  keymaps = [
    {
      mode = ["n" "x"];
      key = "<leader>aa";
      action = "<cmd> lua require('CopilotChat').toggle()<cr>";
      options = {
        desc = "Toggle Copilot Chat";
        silent = true;
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>ax";
      action = "<cmd> lua require('CopilotChat').reset()<cr>";
      options = {
        desc = "Clear Copilot Chat";
        silent = true;
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>aq";
      action = {
        __raw = ''
          function()
            vim.ui.input({prompt = "Quick Chat: "}, function(input)
              if input then
                require("CopilotChat").ask(input)
              end
            end)
          end
        '';
      };
      options = {
        desc = "Quick Chat";
        silent = true;
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>ap";
      action = "<cmd> lua require('CopilotChat').select_prompt()<cr>";
      options = {
        desc = "Prompt Actions";
        silent = true;
      };
    }
  ];

  autoCmd = [
    {
      event = ["BufEnter"];
      pattern = ["copilot-chat"];
      callback = {
        __raw = ''
          function()
            vim.opt_local.relativenumber = false
            vim.opt_local.number = false
          end
        '';
      };
    }
  ];
}
