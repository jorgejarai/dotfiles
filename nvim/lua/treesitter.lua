local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = 'maintained',
    ignore_install = {"ocamllex"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}
