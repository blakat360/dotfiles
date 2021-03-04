:let mapleader = ","

" options
:set wrap relativenumber number

" mappings
:inoremap jk <esc>

" edit vimrc quickly
:nnoremap <leader>ev :vsplit ~/.vimrc<CR>
:nnoremap <leader>sv :source ~/.vimrc<CR>

" navigation
:nnoremap <silent> <c-k> :wincmd k<CR>
:nnoremap <silent> <c-j> :wincmd j<CR>
:nnoremap <silent> <c-h> :wincmd h<CR>
:nnoremap <silent> <c-l> :wincmd l<CR>

:nnoremap <leader><leader> :execute ":bn"<cr>

" nops
:nnoremap <up> <nop>
:nnoremap <down> <nop>
:nnoremap <left> <nop>
:nnoremap <right> <nop>

:inoremap <up> <nop>
:inoremap <down> <nop>
:inoremap <left> <nop>
:inoremap <right> <nop>

:echo "Ave ave cum ave!"
