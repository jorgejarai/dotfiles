local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = {
        'norg', 'bash', 'bibtex', 'c', 'cmake', 'comment', 'cpp', 'css', 'dart',
        'dockerfile', 'glsl', 'go', 'graphql', 'html', 'http', 'javascript',
        'jsdoc', 'json', 'json5', 'jsonc', 'kotlin', 'latex', 'llvm', 'lua',
        'make', 'php', 'phpdoc', 'prisma', 'python', 'regex', 'rust', 'scss',
        'svelte', 'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml'
    },
    autotag = {enable = true},
    highlight = {enable = true},
    indent = {enable = true},
    rainbow = {enable = true, extended_mode = true, max_file_lines = nil}
}
