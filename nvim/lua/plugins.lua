local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

vim.cmd('packadd packer.nvim')
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Plugin manager
    use { -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'editorconfig/editorconfig-vim' -- Editorconfig support
    use 'kassio/neoterm' -- Terminal emulator
    use 'preservim/nerdtree' -- File tree sidebar
    use 'neovim/nvim-lspconfig' -- LSP support
    use { -- Fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}}
    }
    use 'tpope/vim-fugitive' -- Git support
    use 'itchyny/vim-gitbranch' -- Get current Git branch name
    use 'airblade/vim-gitgutter' -- Git gutter
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
    use 'williamboman/nvim-lsp-installer' -- Install missing LSPs
    use 'github/copilot.vim' -- GitHub Copilot
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
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use 'windwp/nvim-ts-autotag' -- Autoclose tags
    use { -- Yode
	'hoschi/yode-nvim',
	config = function()
	    require('yode-nvim').setup({})
	end
    }
    use 'p00f/nvim-ts-rainbow' -- Rainbow parentheses
    use 'ryanoasis/vim-devicons' -- Icons

    if packer_bootstrap then
        require('packer').sync()
    end
end)

