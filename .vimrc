:let mapleader = ","
:let localleader = "\\"

" plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

call plug#end()
" }}}

" options
:set wrap relativenumber number expandtab shiftwidth=2 ignorecase smartcase hlsearch incsearch

colorscheme badwolf
highlight StatusLine ctermbg=180 

" mappings {{{
  :inoremap jk <esc>

  " edit vimrc quickly
  :nnoremap <leader>ev :vsplit ~/.vimrc<CR>
  :nnoremap <leader>sv :source ~/.vimrc<CR>

  " regex helpers
  :nnoremap / /\v
  :nnoremap <leader>nh :execute "nohlsearch"<cr>

  " navigation {{{
  " move between panes
  :nnoremap <silent> <c-k> :wincmd k<CR>
  :nnoremap <silent> <c-j> :wincmd j<CR>
  :nnoremap <silent> <c-h> :wincmd h<CR>
  :nnoremap <silent> <c-l> :wincmd l<CR>

  " move between buffers in pane
  :nnoremap <silent> <leader><leader> :execute ":bn"<cr>
  " open last buffer in new pane for editing
  :nnoremap <leader>. :execute "rightbelow vsplit " . bufname("#")<cr>

  " move to start and end of line
  :nnoremap H 0
  :nnoremap L $
  " }}}

  " nops {{{
  :nnoremap <up> <nop>
  :nnoremap <down> <nop>
  :nnoremap <left> <nop>
  :nnoremap <right> <nop>

  :inoremap <up> <nop>
  :inoremap <down> <nop>
  :inoremap <left> <nop>
  :inoremap <right> <nop>
  " }}}
" }}}

" statusline {{{
:set statusline=[%n]\ 		" buffer number
:set statusline+=%<%.99f\ 	" file name 
:set statusline+=%h		" help buffer flag
:set statusline+=%w		" preview window flag
:set statusline+=%m		" modified flag
:set statusline+=%r		" read-only flag
:set statusline+=%y		" file type
	" line number, column-virtual column
:set statusline+=%=%-16(\ %l,%c-%v\ %)
:set statusline+=%P		" % through file
" }}}

" filetype specific stuff
" vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

:echo "Ave ave cum ave!"
