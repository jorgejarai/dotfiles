require('telescope').setup({
    defaults = {file_ignore_patterns = {'node_modules', 'build'}}
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('repo')
require('telescope').load_extension('neoclip')
require('telescope').load_extension('z')
