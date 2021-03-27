let s:exe = ""

function! RunLast()
  silent :CMakeFindBuildDir
  let command = "" . b:build_dir . "/" . s:exe
  call asyncrun#run("", {}, command)
  copen
endfunction

function! FZFCallback(lines)
  let s:exe = deepcopy(a:lines[0])
  :call RunLast()
endfunction

function! GetExecuteableName(name)
  :silent :CMakeFindBuildDir
  let cur_dir = getcwd()
  execute 'cd' fnameescape(b:build_dir)
  let spec = fzf#wrap({
    \ 'source': 'find . -executable -type f |' .
        \ ' rg -v "CMakeFiles|.git"',
    \ 'sink*': function(a:name) })
  call fzf#run(spec)
  execute 'cd' fnameescape(cur_dir)
  " fzf seems to run async so use callbacks
endfunction

function! ConfigureProject()
  CMake
  let cur_dir = getcwd()
  execute 'cd' fnameescape(b:build_dir . "/..")

  if !filereadable(fnameescape(b:build_dir . "/../.gitignore"))
    silent execute '!echo "g++">.ccls'
    silent execute '!echo "build/">.gitignore'
    silent execute '!echo ".ccls">>.gitignore'
    silent execute '!echo "compile_commands.json">>.gitignore'
  endif

  execute 'cd' fnameescape(cur_dir)
endfunction

nnoremap <buffer> <localleader>c :call ConfigureProject()<cr>
nnoremap <buffer> <localleader>b :make<cr>
nnoremap <buffer> <localleader>r :call GetExecuteableName("FZFCallback")<cr>
nnoremap <buffer> <localleader><cr> :call RunLast()<cr>
