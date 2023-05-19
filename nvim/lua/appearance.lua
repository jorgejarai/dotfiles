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

if not vim.g.vscode then
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
                {'mode', 'paste'},
                {'gitbranch', 'readonly', 'filename', 'modified'}
            },
            right = {
                {'lsp_errors', 'lsp_warnings', 'lsp_ok', 'lineinfo'},
                {'percent'}, {'fileformat', 'fileencoding', 'filetype'}
            }
        },
        component_expand = {lsp_errors = '', lsp_warnings = '', lsp_ok = ''},
        component_function = {gitbranch = 'FugitiveHead'},
        component_type = {
            lsp_warnings = 'warning',
            lsp_errors = 'error',
            lsp_ok = 'middle'
        }
    }

    vim.cmd([[
	hi DiagnosticFloatingInfo guifg=#3191d6

	hi DiagnosticVirtualTextInfo guifg=#3191d6 gui=bold,italic
	hi DiagnosticVirtualTextError guifg=#fe0505 gui=bold,italic
	hi DiagnosticVirtualTextWarn guifg=#faaa17 gui=bold,italic
	hi DiagnosticVirtualTextHint guifg=#3191d6 gui=bold,italic
    ]])

    require('nvim-tree').setup({
        renderer = {
            highlight_git = false,
            highlight_opened_files = "none",
            indent_markers = {enable = true},
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false
                },
                glyphs = {
                    default = "󰈚",
                    symlink = "",
                    folder = {
                        default = "",
                        empty = "",
                        empty_open = "",
                        open = "",
                        symlink = "",
                        symlink_open = "",
                        arrow_open = "",
                        arrow_closed = ""
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌"
                    }
                }
            }
        }
    })
end
