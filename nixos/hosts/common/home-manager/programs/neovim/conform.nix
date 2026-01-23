{
  lib,
  pkgs,
  ...
}: {
  extraPackages = with pkgs; [
    alejandra
    asmfmt
    prettier
    clang-tools
    isort
    black
    yamllint
    yamlfmt
    shellcheck
    shellharden
    shfmt
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = ''
        function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "fallback" }
        end
      '';
      notify_on_error = true;
      notify_no_formatters = true;

      formatters_by_ft = {
        asm = ["asmfmt"];
        c = ["clang_format"];
        cpp = ["clang_format"];
        html = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        css = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        javascriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        typescript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        typescriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        python = ["isort" "black"];
        nix = ["alejandra"];
        markdown = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        yaml = [
          "yamllint"
          "yamlfmt"
        ];
        bash = ["shellcheck" "shellharden" "shfmt"];
        sh = ["shellcheck" "shellharden" "shfmt"];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };

      formatters = {
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
      };
    };

    luaConfig.post = ''
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
          vim.notify("Format on save disabled for current buffer", vim.log.levels.INFO)
        else
          vim.g.disable_autoformat = true
          vim.notify("Format on save disabled", vim.log.levels.INFO)
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
        vim.notify("Format on save enabled", vim.log.levels.INFO)
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    '';
  };
}
