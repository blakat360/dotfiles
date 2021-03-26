let s:exe = ""

function! RunLast()
  :silent :CMakeFindBuildDir
  execute ":!" . b:build_dir . "/" . s:exe
endfunction

function! FZFCallback(lines)
  let s:exe = deepcopy(a:lines[0])
  :call RunLast()
endfunction

function! GetExecuteableName(name)
  :silent :CMakeFindBuildDir
  let cur_dir = expand("%:p:h")
  cd "" . b:build_dir
  let spec = fzf#wrap({
    \ 'source': 'find . -executable -type f |' .
        \ ' rg -v "CMakeFiles|.git"',
    \ 'sink*': function(a:name) })
  call fzf#run(spec)
  cd "" . cur_dir
  " fzf seems to run async so use callbacks
endfunction

nnoremap <buffer> <localleader>c :CMake<cr>
nnoremap <buffer> <localleader>b :make<cr>
nnoremap <buffer> <localleader>r :call GetExecuteableName("FZFCallback")<cr>
nnoremap <buffer> <localleader><cr> :call RunLast()<cr>
