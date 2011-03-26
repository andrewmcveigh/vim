" Vim filetype plugin
" Language:		Sass
" Maintainer:		Tim Pope <vimNOSPAM@tpope.info>

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl cms< inc< ofu<"

setlocal softtabstop=2
setlocal shiftwidth=2

autocmd! BufWriteCmd *.js :call Refresh_firefox_js()
function! Refresh_firefox_js()
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

"set makeprg=jsl\ --nologo\ --nofilelisting\ --nosummary\ --conf=/etc/jsl.conf\ %
"set errorformat=%f(%l):\ %m
setlocal makeprg=modcon
inoremap <silent> <F5> <C-O>:make<CR>
map <silent> <F5> :make<CR>

inoremap <expr> <cr> <SID>bracesEnter()

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

nnoremap \fif ^wwwa = 0; i <<ESC>wdwea.length; i++<ESC>
nnoremap \pir /parseInt<CR>w%i, 10<ESC>
