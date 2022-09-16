-- vim.cmd([[
-- augroup fmt
--     autocmd!
--     au BufWritePre * try | undojoin | Neoformat | catch /^Vim\\%((\\a\\+)\\)\\=:E790/ | endtry
-- augroup END
-- ]])

vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])

vim.g.neoformat_enabled_python = {
    'autopep8', 'docformatter', 'clang-format', 'cmake_format', 'prettierd',
    'latexindent', 'luaformatter', 'rustfmt', 'shfmt'
}
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_try_node_exe = 1

vim.g.shmfmt_opt = '-ci'
