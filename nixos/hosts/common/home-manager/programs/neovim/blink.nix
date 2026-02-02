{
  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        keymap.preset = "enter";

        appearance.nerd_font_variant = "mono";
        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
            window.border = "rounded";
          };
          menu = {
            auto_show = false;
            border = "rounded";
          };
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "copilot"
            "git"
          ];

          providers = {
            copilot = {
              async = true;
              module = "blink-cmp-copilot";
              name = "copilot";
              score_offset = 100;
            };

            git = {
              module = "blink-cmp-git";
              name = "git";
              score_offset = 100;
              opts = {
                commit = {};
                git_centers = {git_hub = {};};
              };
            };
          };
        };

        fuzzy.implementation = "prefer_rust_with_warning";
      };
    };

    blink-cmp-copilot.enable = true;
    blink-cmp-git.enable = true;
  };
}
