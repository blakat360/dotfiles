:let mapleader = ","
:let localleader = "\\"

" plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-surround'

Plug 'skywind3000/asyncrun.vim'

Plug 'vhdirk/vim-cmake'
Plug 'bfrg/vim-cpp-modern'

Plug 'plasticboy/vim-markdown'
" vim-markdown options {{{
let g:vim_markdown_math                      = 1
let g:vim_markdown_new_list_item_indent      = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite                 = 1
let g:vim_markdown_edit_url_in               = 'vsplit'
" }}}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

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
  nnoremap / /\v
  nnoremap <silent> <CR> mm:noh<CR><CR>`m

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
" cpp {{{
augroup filetype_cpp
  autocmd!
  autocmd BufRead,BufNewFile *.tpp setlocal filetype=cpp
augroup END
" }}}

:echo "Ave ave cum ave!"
