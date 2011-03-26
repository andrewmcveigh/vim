" Vim filetype plugin
" Language:		Sass
" Maintainer:		Tim Pope <vimNOSPAM@tpope.info>

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl cms< inc< ofu<"

setlocal commentstring=//\ %s
setlocal omnifunc=csscomplete#CompleteCSS

let &l:include = '^\s*@import\s\+\%(url(\)\='

set softtabstop=2
set shiftwidth=2

autocmd BufWriteCmd *.sass :call Refresh_firefox_css()
function! Refresh_firefox_css()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
                 \ vimXo = content.window.pageXOffset;
                 \ BrowserReload();
                 \ content.window.scrollTo(vimXo,vimYo);
                 \ repl.quit();'  |
                 \ nc localhost 4242 2>&1 > /dev/null
  endif
endfunction
