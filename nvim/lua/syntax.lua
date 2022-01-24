-- Activate nvim-lightbulb when cursor is idle
vim.cmd(
    "autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()")

-- Format options
vim.opt.formatoptions = vim.opt.formatoptions + {
    t = true,
    c = true,
    r = true,
    q = true,
    n = true,
    j = true
}

require('Comment').setup()

-- Custom indent settings
vim.cmd('autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab')
vim.cmd('autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=0 expandtab')
vim.cmd('autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab')
vim.cmd('autocmd Filetype typescriptreact setlocal ts=2 sw=2 sts=0 expandtab')
vim.cmd('autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab')

-- nvim-autopairs
require('nvim-autopairs').setup({
    enable_check_bracket_line = false
})
