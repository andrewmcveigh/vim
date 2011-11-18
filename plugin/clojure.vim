" VimClojure Settings
let vimclojure#WantNailgun = 1
if os == "Linux"
  let vimclojure#NailgunClient = $HOME . "/Dropbox/Config/dotfiles/vim/vimclojure-nailgun-client/ubuntu10.10/ng"
elseif os == "Darwin"
  let vimclojure#NailgunClient = $HOME . "/Dropbox/Config/dotfiles/vim/vimclojure-nailgun-client/ng"
endif
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#SplitPos = "right"
let vimclojure#SplitSize = 60

function! Refresh_hiccup()
    if &modified
        write
        call Refresh_firefox()
    endif
endfunction
autocmd BufWriteCmd *.hiccup :call Refresh_hiccup()

function! s:NailGunStart()
    echo system("ng &")
endfunction
command! NailGunStart call <SID>NailGunStart()

function! s:NailGunStop()
    let os = substitute(system('uname'), "\n", "", "")
    if os == "Linux"
        echo system("~/.vim/vimclojure-nailgun-client/ubuntu10.10/ng ng-stop")
    elseif os == "Darwin"
        echo system("~/.vim/vimclojure-nailgun-client/ng ng-stop")
    endif
endfunction
command! NailGunStop call <SID>NailGunStop()

" toggle clojure line comments
vmap <LEADER>// :s/\(^;\(.*$\)\)\\|\(^.*$\)/\=len(submatch(2))>0?submatch(2):";".submatch(3)/g<CR>:nohl<CR>
nmap <LEADER>// V<LEADER>//
imap <F5> :CakeReload<CR>
nmap <F5> :CakeReload<CR>
vmap <F5> :CakeReload<CR>
