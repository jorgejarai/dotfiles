{
  plugins = {
    lspkind = {
      enable = true;
      settings = {
        symbol_map = {
          Copilot = " ";
        };
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
    lspsaga = {
      enable = true;
      settings = {
        lightbulb = {
          enable = true;
          virtual_text = false;
        };
      };
    };
    lsp-lines.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        cssls.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        eslint.enable = true;
        html.enable = true;
        jdtls.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        ts_ls.enable = true;
        marksman.enable = true;
        nginx_language_server.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        pyright.enable = true;
        vue_ls.enable = true;
        yamlls = {
          enable = true;
          extraOptions.settings = {
            yaml.schemaStore = {
              enable = false;
              url = "";
            };
          };
        };
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };

    mini-ai = {
      enable = true;
      settings = {
        custom_textobjects = {
          f = {
            __raw = "require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' })";
          };
          c = {
            __raw = "require('mini.ai').gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' })";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border},
      virtual_text = false,
      virtual_lines = true
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
