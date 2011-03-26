" Vim filetype plugin
" Language:		C#
" Maintainer:		Andrew Mcveigh <me@andrewmcveigh.com>

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

inoremap <expr> <CR> <SID>bracesEnter()

function! s:bracesEnter()
    let l:lst = ['{}']
    let l:col = col('.')
    let l:line = getline('.')
    let l:chr = l:line[l:col-2 : l:col-1]
    if index(l:lst, l:chr) > -1
        return "O"
    else
        let l:chr = l:line[l:col-3:l:col-2]
        if (index(l:lst, l:chr)) > - 1
            return "\<cr>"
        endif
        return "\<cr>"
endfunction
