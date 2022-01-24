-- vim.cmd('au BufWritePre * undojoin | Neoformat')
vim.cmd(
    'au BufWritePre * try | undojoin | Neoformat | catch /^Vim\\%((\\a\\+)\\)\\=:E790/ | endtry')

vim.g.neoformat_enabled_python = {
    'autopep8', 'docformatter', 'clang-format', 'cmake_format', 'prettier',
    'latexindent', 'luaformatter', 'rustfmt', 'shfmt'
}

vim.g.neoformat_basic_format_trim = 1

vim.g.shmfmt_opt = '-ci'
