" Check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/gv.vim'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" let g:livepreview_previewer = 'zathura'
" let g:livepreview_cursorhold_recompile = 0
" Plug 'matthewsimo/angular-vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf =  'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
Plug 'reedes/vim-colors-pencil'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'dart-lang/dart-vim-plugin'
Plug 'cespare/vim-toml'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-scripts/dbext.vim'

call plug#end()

call glaive#Install()
