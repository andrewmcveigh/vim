" Vim compiler file
" Compiler: NUnit

if exists("current_compiler")
finish
endif
let current_compiler = "nunit"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
command! -nargs=* CompilerSet setlocal <args>
endif

" default errorformat
CompilerSet errorformat=%f(%l\\\,%c):\ %m

" default make
CompilerSet makeprg=msbuild-remote;nunit-remote
