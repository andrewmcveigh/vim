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

setlocal softtabstop=2
setlocal shiftwidth=2

function! Refresh_sass()
    if &modified
        write
        let split_path = split(expand('%:p:h'), '/')
        if (split_path[len(split_path) - 2] == 'src') && (split_path[len(split_path) - 1] == 'sass')
            !compass compile
        else
            silent !sass % %:p:r.css
        endif
        silent !echo  'vimYo = content.window.pageYOffset;
                    \ vimXo = content.window.pageXOffset;
                    \ BrowserReload();
                    \ content.window.scrollTo(vimXo,vimYo);
                    \ repl.quit();'  |
                    \ nc localhost 4242 2>&1 > /dev/null
    endif
endfunction
autocmd BufWriteCmd *.sass :call Refresh_sass()
nnoremap <F6> :call Refresh_sass()<CR>
