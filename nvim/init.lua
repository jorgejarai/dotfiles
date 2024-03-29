require('general')
require('plugins')
require('appearance')
require('keymaps')
require('syntax')
require('commands')

if not vim.g.vscode then
    require('autocomplete')
    require('lsp')
    require('telescope_conf')
    require('neoterm')
    require('texlab')
end

require('treesitter')
require('autoformat')
