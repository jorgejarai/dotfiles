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
inoremap <silent> <M-Left> <ESC>:wincmd h<CR>i
inoremap <silent> <M-Down> <ESC>:wincmd j<CR>i
inoremap <silent> <M-Up> <ESC>:wincmd k<CR>i
inoremap <silent> <M-Right> <ESC>:wincmd l<CR>i

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
nnoremap <silent> <C-S-PageUp> :tabp<CR>
nnoremap <silent> <C-S-PageDown> :tabn<CR>
nnoremap <silent> <C-S-C> :tabc<CR>
inoremap <silent> <C-S-Left> <ESC>:tabp<CR>i
inoremap <silent> <C-S-Right> <ESC>:tabn<CR>i
inoremap <silent> <C-S-PageUp> <ESC>:tabp<CR>i
inoremap <silent> <C-S-PageDown> <ESC>:tabn<CR>i
inoremap <silent> <C-S-C> <ESC>:tabc<CR>i
cnoreabbrev te tabedit

" Map :W to :w
cnoreabbrev W w

" Map :waq to :wqa
cnoreabbrev waq wqa
