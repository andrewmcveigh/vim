
" C# compiler on
" setup C# building
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufNewFile,BufRead *.cs compiler devenv
  autocmd BufNewFile,BufRead *.aspx compiler devenv
  autocmd BufNewFile,BufRead *.ascx compiler devenv
  autocmd BufNewFile,BufRead *.rdlc compiler devenv
  map <F5> :make<CR>
  map <F6> :!nunit-remote<CR>
endif

function! s:Clean()
    echo system("msbuild-remote clean")
endfunction
command! Clean call <SID>Clean()

function! s:Rebuild()
    echo system("msbuild-remote rebuild")
endfunction
command! Rebuild call <SID>Rebuild()

function! s:GenSvcProxy()
    let url = input("Enter URL of service: ")
    let namespace = input("Enter namespace for proxy class: ")
    echo system("genrefs " . namespace . " ". url)
endfunction
command! GenSvcProxy call <SID>GenSvcProxy()
