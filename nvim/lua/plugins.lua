local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

vim.cmd [[
    augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- vim.cmd('packadd packer.nvim')
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Plugin manager
    use { -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'editorconfig/editorconfig-vim' -- Editorconfig support
    use 'kassio/neoterm' -- Terminal emulator
    use { -- LSP server installer
        "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    use { -- Fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}}
    }
    use 'tpope/vim-fugitive' -- Git support
    use 'itchyny/vim-gitbranch' -- Get current Git branch name
    use 'junegunn/vim-peekaboo' -- Preview contents of registers
    use 'kosayoda/nvim-lightbulb' -- Shows available code actions
    use 'mhinz/vim-startify' -- Start screen
    use 'aymericbeaumet/vim-symlink' -- Follow symlinks
    use { -- Code completion
        'hrsh7th/nvim-cmp',
        requires = {
            'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline'
        }
    }
    use 'SirVer/UltiSnips' -- Snippets
    use 'sbdchd/neoformat' -- Autoformat files
    use 'simrat39/rust-tools.nvim' -- Utils for Rust
    use 'numToStr/Comment.nvim' -- Comment shortcut
    use 'junegunn/vim-easy-align' -- Text alignment
    use 'szw/vim-maximizer' -- Maximise split windows
    use 'rakr/vim-one' -- Nice light theme
    use 'psliwka/vim-smoothie' -- Smooth scrolling
    use 'tpope/vim-surround' -- Easier surrounding
    use 'christoomey/vim-tmux-navigator' -- Navigate between windows
    use 'chaoren/vim-wordmotion' -- Better inter-word movement
    use 'vimwiki/vimwiki' -- Personal wiki
    use 'windwp/nvim-autopairs' -- Autoclose parentheses
    use { -- Jump through document
        'phaazon/hop.nvim',
        branch = 'v1',
        config = function() require('hop').setup() end
    }
    use { -- Status line
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'windwp/nvim-ts-autotag' -- Autoclose tags
    use 'p00f/nvim-ts-rainbow' -- Rainbow parentheses
    -- use {
    --     'narutoxy/dim.lua',
    --     requires = {'nvim-treesitter/nvim-treesitter', 'neovim/nvim-lspconfig'},
    --     config = function() require('dim').setup({}) end
    -- }
    use { -- File tree sidebar
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use { -- Icons
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup({default = true})
        end
    }
    use 'b0o/schemastore.nvim' -- JSON schemas
    use { -- Fix CursorHold issues
        'antoinemadec/FixCursorHold.nvim',
        config = function() vim.g.cursorhold_updatetime = 100 end
    }
    use { -- Git gutter
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use { -- FZF for Telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use 'cljoly/telescope-repo.nvim'
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'tami5/sqlite.lua', module = 'sqlite'},
            {'nvim-telescope/telescope.nvim'}
        },
        config = function()
            require('neoclip').setup({enable_persistent_history = true})
        end
    }
    use 'nvim-telescope/telescope-z.nvim'
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function() require("copilot").setup({}) end
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = {"copilot.lua"},
        config = function()
            -- require("copilot_cmp").setup({
            --     method = 'getCompletionsCycling',
            --     insert_text = require('copilot_cmp.format').remove_existing
            -- })
        end
    }
    use {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require("flutter-tools").setup({}) end
    }
    use {'onsails/lspkind-nvim'}
    use {'p00f/clangd_extensions.nvim'}
    use {'eandrju/cellular-automaton.nvim'}
    use {'jose-elias-alvarez/typescript.nvim'}
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({})
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup({}) end
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require("treesitter-context").setup({
                mode = 'topline',
                line_numbers = true
            })
        end
    }

    if packer_bootstrap then require('packer').sync() end
end)

