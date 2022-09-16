-- vim.opt.autoread = true
-- vim.opt.encoding = 'UTF-8'
-- vim.opt.hidden = true
vim.opt.inccommand = 'split'
vim.opt.mouse = 'a'
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.wildignore = {'.git/*', 'build/*', 'node_modules/*'}
vim.opt.wildignorecase = true
vim.opt.wildmode = {'longest', 'list', 'full'}
vim.opt.wrap = true
vim.opt.filetype = 'on'
vim.opt.lazyredraw = true
vim.opt.shell = '/bin/bash'

-- Search
-- vim.opt.hlsearch = true
vim.opt.ignorecase = true
-- vim.opt.incsearch = true
vim.opt.smartcase = true

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 8

vim.opt.listchars = {tab = '»·', trail = '·'}

-- Persist undo history between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.cache/nvim/undodir')

-- Swap directory
local swap_dir = vim.fn.expand('~/.cache/nvim/swap')
if vim.fn.isdirectory(swap_dir) == 0 then vim.fn.mkdir(swap_dir, 'p') end

vim.opt.directory = swap_dir
