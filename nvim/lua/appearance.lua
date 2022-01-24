vim.cmd('colorscheme one')

vim.opt.background = 'light'
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 300
-- vim.opt.showcmd = true
vim.opt.showmode = false

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = '80'

vim.cmd(
    'au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}')

require('lualine').setup({
    options = {
        theme = 'onelight',
        section_separators = '',
        component_separators = ''
    }
})

vim.g.lightline = {
    colorscheme = 'one',
    active = {
        left = {
            {'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}
        },
        right = {
            {'lsp_errors', 'lsp_warnings', 'lsp_ok', 'lineinfo'}, {'percent'},
            {'fileformat', 'fileencoding', 'filetype'}
        }
    },
    component_expand = {
        lsp_errors = '',
        lsp_warnings = '',
        lsp_ok = ''
    },
    component_function = {
        gitbranch = 'FugitiveHead'
    },
    component_type = {
        lsp_warnings = 'warning',
        lsp_errors = 'error',
        lsp_ok = 'middle'
    }
}
