let s:exe = ""

function! s:FZFCallback(lines)
  echom 'value of lines[0] is ' . a:lines[0]
  let s:exe = deepcopy(a:lines[0])
  echom 'value of s:exe from helper is ' . a:lines[0]
endfunction

function! GetExecuteableName()
  let spec = fzf#wrap({
    \ 'source': 'find . -executable -type f |' .
        \ ' rg -v "CMakeFiles|.git"',
    \ 'sink*': function("s:FZFCallback") })
  call fzf#run(spec)
  " fzf seems to run async so use callbacks
endfunction

nnoremap <buffer> <localleader>c :CMake<cr>
nnoremap <buffer> <localleader>b :make<cr>
nnoremap <buffer> <localleader>r :call GetExecuteableName()<cr>
nnoremap <buffer> <localleader><cr> :call GetExecuteableName()<cr>
