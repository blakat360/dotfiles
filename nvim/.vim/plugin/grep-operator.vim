nnoremap <silent> <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <silent> <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    normal! `[y`]
  else
    return
  endif

  silent execute "grep! -R " . shellescape(@@) . " ."
  silent copen

  let @@ = saved_unnamed_register
endfunction
