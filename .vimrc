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

:nnoremap H 0
:nnoremap L $

" statusline
:set statusline=[%n]\ 		" buffer number
:set statusline+=%<%.99f\	" file name 
:set statusline+=%h		" help buffer flag
:set statusline+=%w		" preview window flag
:set statusline+=%m		" modified flag
:set statusline+=%r		" read-only flag
:set statusline+=%y		" file type
" line number, column-virtual column
:set statusline+=%=%-16(\ %l,%c-%v\ %)
:set statusline+=%P		" % through file

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
