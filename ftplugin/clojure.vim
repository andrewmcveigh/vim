
" VimClojure Settings {{{

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
let vimclojure#SplitSize = 80

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

function! ClojureCommentSelection()
    substitute/\(^;\(.*$\)\)\|\(^.*$\)/\=len(submatch(2))>0?submatch(2):";".submatch(3)/g
    nohl
endfunction

" toggle clojure line comments
"vnoremap <LEADER>// :call ClojureCommentSelection()<CR>
"nnoremap <LEADER>// V:call ClojureCommentSelection()<CR>
"nnoremap <LEADER>/p vip:call ClojureCommentSelection()<CR>
"inoremap <F5> :CakeReload<CR>
"nnoremap <F5> :CakeReload<CR>
"vnoremap <F5> :CakeReload<CR>

setlocal iskeyword-=.

function! NewFile(v)
    if &filetype == 'clojure'
        let current  = getcwd()
        let splitdir = split(@%, 'src')
        if len(splitdir) > 1
            let workdir  = substitute(splitdir[0], current, '', 'g')
            let cur_ns   = join(split(split(splitdir[1], '\.')[0], '/'), '.')
            set iskeyword-=.
            let ns = input('Enter Namespace: ', cur_ns)
            if ns != ''
                set iskeyword+=.
                let ns_split = split(ns, '\.')
                let path = workdir . 'src/' . join(ns_split[0:-2], '/')
                let filename = workdir . 'src/' . join(ns_split, '/') . '.clj'
                if !filereadable(filename)
                    if !isdirectory(path)
                        let createdir = input('Directory ['.path.'] does not exist. Create? [Yn]: ')
                        if createdir == 'Y' || createdir == 'y' || createdir == ''
                            execute "!mkdir -p ".path
                        else
                            return
                        endif
                    endif
                else
                    echo 'File Exists!'
                    return
                endif
                if a:v
                    silent! execute 'vsplit '.filename
                else
                    silent! execute 'split '.filename
                endif
                call append(0, "(ns ".ns.")")
            endif
        else
            echo 'Invalid Namespace!'
            return
        endif
    else
        new
    endif
endfunction

cnoremap new :call NewFile(0)<CR>
cnoremap vnew :call NewFile(1)<CR>

" }}}
