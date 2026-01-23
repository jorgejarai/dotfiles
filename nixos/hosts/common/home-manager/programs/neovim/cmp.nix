{pkgs, ...}: {
  plugins = {
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<S-TAB>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<TAB>" = "cmp.mapping.select_next_item(cmp_select)";
          "<C-space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({
                                  select = true,
                                  behavior = cmp.ConfirmBehavior.Insert })";
        };

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {name = "nvim_lua";}
          {name = "nvim_lsp";}
          {name = "cmdline";}
          {name = "path";}
          {name = "luasnip";}
          {name = "buffer";}
        ];

        window.documentation.border = [
          "╭"
          "─"
          "╮"
          "│"
          "╯"
          "─"
          "╰"
          "│"
        ];
      };
    };
    cmp-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-cmdline.enable = true;
    cmp-path.enable = true;
    luasnip.enable = true;
  };

  extraConfigLua = ''
    -- Extra options for cmp-cmdline setup
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
    	mapping = cmp.mapping.preset.cmdline(),
    	sources = cmp.config.sources({
    		{ name = "path" },
    	}, {
    		{
    			name = "cmdline",
    			option = {
    				ignore_cmds = { "Man", "!" },
    			},
    		},
    	}),
    })
  '';
}
