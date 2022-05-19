local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Set leader
vim.g.mapleader = ' '

-- nvim-tree
map('n', '<c-n>', ':NvimTreeToggle<CR>', {silent = true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {silent = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {silent = true})

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
map('n', '<leader>fw', '<cmd>Telescope file_browser<CR>')

-- Edit settings
map('n', '<leader>e', ':e $MYVIMRC<CR>', {silent = true})

-- Install plugins
map('n', '<leader>p', ':PackerSync<CR>', {silent = true})

-- Maximizer
map('n', '<leader>m', ':MaximizerToggle!<CR>', {silent = true})

-- Tabs
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
map('n', '<leader>0', ':tablast<CR>')

map('n', '<leader>[', 'gT')
map('n', '<leader>]', 'gt')

map('n', '<leader>x', ':tabclose<CR>')

vim.cmd('cnoreabbrev te tabedit')
vim.cmd('cnoreabbrev tn tabnew')
vim.cmd('cnoreabbrev tc tabclose')
vim.cmd('cnoreabbrev to tabonly')

-- Window split
map('n', '<Leader>zv', ':wincmd v<CR>', {silent = true})
map('n', '<Leader>zs', ':wincmd s<CR>', {silent = true})

-- Equalise window size
map('n', '<silent>', '<Leader>= :wincmd =<CR>')

-- Neoterm
map('n', '<c-q>', ':Ttoggle<CR>')
map('i', '<c-q>', '<Esc>:Ttoggle<CR>')
map('t', '<c-q>', '<c-\\><c-n>:Ttoggle<CR>')

-- git-fugitive
map('n', '<leader>gg', ':G<CR>')

-- Hop
map('', 's', '<cmd>HopChar1<CR>')
map('o', 's', '<cmd>HopChar1<CR>')

-- Copilot
map('i', '<C-j>', 'copilot#Accept("<CR>")', {expr = true, silent = true})
map('n', '<leader>cd', ':Copilot disable<CR>')
map('n', '<leader>ce', ':Copilot enable<CR>')

-- nvim-yode
map('', '<leader>yc', ':YodeCreateSeditorFloating<CR>')
map('', '<leader>yr', ':YodeCreateSeditorReplace<CR>')
map('n', '<leader>bd', ':YodeBufferDelete<CR>')

map('', '<C-W>r', ':YodeLayoutShiftWinDown<CR>')
map('', '<C-W>R', ':YodeLayoutShiftWinUp<CR>')
map('', '<C-W>J', ':YodeLayoutShiftWinBottom<CR>')
map('', '<C-W>K', ':YodeLayoutShiftWinTop<CR>')

vim.cmd('set showtabline=2')

-- vim-easy-align
vim.cmd [[
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
]]

-- Save, edit and close commands
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
vim.cmd('cnoreabbrev wQ wq')
vim.cmd('cnoreabbrev Wq wq')
vim.cmd('cnoreabbrev WQ wq')
vim.cmd('cnoreabbrev Qa qa')
vim.cmd('cnoreabbrev qA qa')
vim.cmd('cnoreabbrev E e')
