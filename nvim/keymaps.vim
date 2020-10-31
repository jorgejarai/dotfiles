let mapleader=" "

" Reload settings
nnoremap <silent> <Leader><Return> :so ~/.config/nvim/init.vim<CR>

" Save a file as root using tee
nnoremap <silent> <Leader>W :w !sudo tee % > /dev/null

" Move between windows
nnoremap <silent> <M-Left> :wincmd h<CR>
nnoremap <silent> <M-Down> :wincmd j<CR>
nnoremap <silent> <M-Up> :wincmd k<CR>
nnoremap <silent> <M-Right> :wincmd l<CR>

" Window split
nnoremap <silent> <Leader>v :wincmd v<CR>
nnoremap <silent> <Leader>s :wincmd s<CR>

" Equalise window size
nnoremap <silent> <Leader>= :wincmd =<CR>

" Centering the cursor while moving between search matches
nnoremap n nzzzv
nnoremap N Nzzzv

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tab operation
nnoremap <silent> <C-S-Left> :tabp<CR>
nnoremap <silent> <C-S-Right> :tabn<CR>
nnoremap <silent> <C-S-C> :tabc<CR>
cnoreabbrev te tabedit

" Map :W to :w
cnoreabbrev W w
