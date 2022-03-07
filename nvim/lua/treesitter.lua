local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = 'maintained',
    autotag = {
	enable = true,
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    rainbow = {
	enable = true,
	extended_mode = true,
	max_file_lines = nil
    }
}
