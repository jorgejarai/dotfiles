local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = 'maintained',
    ignore_install = {'ocamllex'},
    autotag = {
	enable = true,
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}
