{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile = {
        enabled = true;
        notify = true;
      };
      explorer = {
        replace_netrw = true;
        trash = true;
      };
      image.enabled = true;
      lazygit.enabled = true;
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      picker.enabled = true;
      scope.enabled = true;
      scroll.enabled = true;
    };
  };

  keymaps = [
    # Top Pickers & Explorer
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.smart()<CR>";
      options.desc = "Smart Find Files";
    }
    {
      mode = "n";
      key = "<leader>,";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options.desc = "Grep";
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options.desc = "Notification History";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.explorer()<CR>";
      options.desc = "File Explorer";
    }
    # find
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>";
      options.desc = "Find Config File";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.git_files()<CR>";
      options.desc = "Find Git Files";
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>lua Snacks.picker.projects()<CR>";
      options.desc = "Projects";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options.desc = "Recent";
    }
    # git
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>lua Snacks.picker.git_branches()<CR>";
      options.desc = "Git Branches";
    }
    {
      mode = "n";
      key = "<leader>gl";
      action = "<cmd>lua Snacks.picker.git_log()<CR>";
      options.desc = "Git Log";
    }
    {
      mode = "n";
      key = "<leader>gL";
      action = "<cmd>lua Snacks.picker.git_log_line()<CR>";
      options.desc = "Git Log Line";
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options.desc = "Git Status";
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>lua Snacks.picker.git_stash()<CR>";
      options.desc = "Git Stash";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua Snacks.picker.git_diff()<CR>";
      options.desc = "Git Diff (Hunks)";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>lua Snacks.picker.git_log_file()<CR>";
      options.desc = "Git Log File";
    }
    # gh
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>lua Snacks.picker.gh_issue()<CR>";
      options.desc = "GitHub Issues (open)";
    }
    {
      mode = "n";
      key = "<leader>gI";
      action = "<cmd>lua Snacks.picker.gh_issue({ state = 'all' })<CR>";
      options.desc = "GitHub Issues (all)";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>lua Snacks.picker.gh_pr()<CR>";
      options.desc = "GitHub Pull Requests (open)";
    }
    {
      mode = "n";
      key = "<leader>gP";
      action = "<cmd>lua Snacks.picker.gh_pr({ state = 'all' })<CR>";
      options.desc = "GitHub Pull Requests (all)";
    }
    # Grep
    {
      mode = "n";
      key = "<leader>sb";
      action = "<cmd>lua Snacks.picker.lines()<CR>";
      options.desc = "Buffer Lines";
    }
    {
      mode = "n";
      key = "<leader>sB";
      action = "<cmd>lua Snacks.picker.grep_buffers()<CR>";
      options.desc = "Grep Open Buffers";
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options.desc = "Grep";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>sw";
      action = "<cmd>lua Snacks.picker.grep_word()<CR>";
      options.desc = "Visual selection or word";
    }
    # search
    {
      mode = "n";
      key = "<leader>s\"";
      action = "<cmd>lua Snacks.picker.registers()<CR>";
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action = "<cmd>lua Snacks.picker.search_history()<CR>";
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>sa";
      action = "<cmd>lua Snacks.picker.autocmds()<CR>";
      options.desc = "Autocmds";
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>sC";
      action = "<cmd>lua Snacks.picker.commands()<CR>";
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
      options.desc = "Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sD";
      action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
      options.desc = "Buffer Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>lua Snacks.picker.help()<CR>";
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>sH";
      action = "<cmd>lua Snacks.picker.highlights()<CR>";
      options.desc = "Highlights";
    }
    {
      mode = "n";
      key = "<leader>si";
      action = "<cmd>lua Snacks.picker.icons()<CR>";
      options.desc = "Icons";
    }
    {
      mode = "n";
      key = "<leader>sj";
      action = "<cmd>lua Snacks.picker.jumps()<CR>";
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>lua Snacks.picker.loclist()<CR>";
      options.desc = "Location List";
    }
    {
      mode = "n";
      key = "<leader>sm";
      action = "<cmd>lua Snacks.picker.marks()<CR>";
      options.desc = "Marks";
    }
    {
      mode = "n";
      key = "<leader>sM";
      action = "<cmd>lua Snacks.picker.man()<CR>";
      options.desc = "Man Pages";
    }
    {
      mode = "n";
      key = "<leader>sp";
      action = "<cmd>lua Snacks.picker.lazy()<CR>";
      options.desc = "Search for Plugin Spec";
    }
    {
      mode = "n";
      key = "<leader>sq";
      action = "<cmd>lua Snacks.picker.qflist()<CR>";
      options.desc = "Quickfix List";
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>lua Snacks.picker.resume()<CR>";
      options.desc = "Resume";
    }
    {
      mode = "n";
      key = "<leader>su";
      action = "<cmd>lua Snacks.picker.undo()<CR>";
      options.desc = "Undo History";
    }
    {
      mode = "n";
      key = "<leader>uC";
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
      options.desc = "Colorschemes";
    }
    # LSP
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
      options.desc = "Goto Definition";
    }
    {
      mode = "n";
      key = "gD";
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
      options.desc = "Goto Declaration";
    }
    {
      mode = "n";
      key = "gr";
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
      options = {
        nowait = true;
        desc = "References";
      };
    }
    {
      mode = "n";
      key = "gI";
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
      options.desc = "Goto Implementation";
    }
    {
      mode = "n";
      key = "gy";
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
      options.desc = "Goto T[y]pe Definition";
    }
    {
      mode = "n";
      key = "gai";
      action = "<cmd>lua Snacks.picker.lsp_incoming_calls()<CR>";
      options.desc = "C[a]lls Incoming";
    }
    {
      mode = "n";
      key = "gao";
      action = "<cmd>lua Snacks.picker.lsp_outgoing_calls()<CR>";
      options.desc = "C[a]lls Outgoing";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
      options.desc = "LSP Symbols";
    }
    {
      mode = "n";
      key = "<leader>sS";
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
      options.desc = "LSP Workspace Symbols";
    }
    # Other
    {
      mode = "n";
      key = "<leader>z";
      action = "<cmd>lua Snacks.zen()<CR>";
      options.desc = "Toggle Zen Mode";
    }
    {
      mode = "n";
      key = "<leader>Z";
      action = "<cmd>lua Snacks.zen.zoom()<CR>";
      options.desc = "Toggle Zoom";
    }
    {
      mode = "n";
      key = "<leader>.";
      action = "<cmd>lua Snacks.scratch()<CR>";
      options.desc = "Toggle Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>S";
      action = "<cmd>lua Snacks.scratch.select()<CR>";
      options.desc = "Select Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options.desc = "Delete Buffer";
    }
    {
      mode = "n";
      key = "<leader>cR";
      action = "<cmd>lua Snacks.rename.rename_file()<CR>";
      options.desc = "Rename File";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>gB";
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options.desc = "Git Browse";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options.desc = "Lazygit";
    }
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<CR>";
      options.desc = "Dismiss All Notifications";
    }
    {
      mode = "n";
      key = "<c-/>";
      action = "<cmd>lua Snacks.terminal()<CR>";
      options.desc = "Toggle Terminal";
    }
    {
      mode = "n";
      key = "<c-_>";
      action = "<cmd>lua Snacks.terminal()<CR>";
      options.desc = "which_key_ignore";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "]]";
      action = "<cmd>lua Snacks.words.jump(vim.v.count1)<CR>";
      options.desc = "Next Reference";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "[[";
      action = "<cmd>lua Snacks.words.jump(-vim.v.count1)<CR>";
      options.desc = "Prev Reference";
    }
    {
      mode = "n";
      key = "<leader>N";
      action = ''
        <cmd>lua Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })<CR>
      '';
      options.desc = "Neovim News";
    }
  ];
}
