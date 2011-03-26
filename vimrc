set autowrite                   " autosave before make/change buffer
set softtabstop=4               " default tabstop width 4
set shiftwidth=4                " default shift width 4
set noautoindent                " auto indent off
set nosmartindent               " smart indent off
set expandtab                   " tabs render as spaces
set background=dark             " background color
set number                      " line numbers on
set guioptions-=l               " disable gui chrome
set guioptions-=L               " "
set guioptions-=r               " "
set guioptions-=R               " "
set guioptions-=b               " "
set guioptions-=B               " "
set guioptions-=T               " "
set modeline                    " enable modelines
set exrc			" enable per-directory .vimrc files
set secure			" disable unsafe commands in local .vimrc files
set scrolloff=5                 " scroll offset 5 lines, I.E., keep 5 lines (minimum) above/below cursor
set visualbell
colorscheme liquidcarbon        " theme = liquidcarbon
syntax on                       " syntax highlighting on
filetype plugin indent on       " filetype indent on
filetype plugin on              " filetype plugin on

let mapleader = ","
let maplocalleader = ","

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" Ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
" Do Linux-specific stuff.
  set guifont=DejaVu\ Sans\ Mono\ 12
  nnoremap <C-s> :w<CR>
  nnoremap <C-a> ggVG
  inoremap <C-s> <ESC>:w<CR>i
  inoremap <C-a> <ESC>ggVG
elseif os == "Darwin"
  set guifont=Monaco:h13
  "set guifont=DejaVu\ Sans\ Mono\ 15
  if has("gui_running")
    set transparency=20
  endif
endif
au BufRead,BufNewFile *.js set ft=javascript.jquery

" VimClojure Settings
let vimclojure#WantNailgun = 1
if os == "Linux"
  let vimclojure#NailgunClient = $HOME . "/Dropbox/Config/dotfiles/.vim/vimclojure-nailgun-client/ubuntu10.10/ng"
elseif os == "Darwin"
  let vimclojure#NailgunClient = $HOME . "/Dropbox/Config/dotfiles/.vim/vimclojure-nailgun-client/ng"
endif
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#SplitPos = "right"
let vimclojure#SplitSize = 60

echo $CLOJURE_SOURCE_DIRS


" Supertab settings
let g:SuperTabDefaultCompletionTypeDiscovery = [ "&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>", ]
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

" Reload .vimrc after saving for instant feedback
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Move swp files
set backupdir=~/.temp/backup//
set directory=~/.temp/swp//

" move windows with arrow keys (Mac = alt+hljk)
map <up>    :wincmd k<CR>
map <down>  :wincmd j<CR>
map <right> :wincmd l<CR>
map <left>  :wincmd h<CR>
if os == "Linux"
    nnoremap <C-k>   :wincmd k<CR>
    nnoremap <C-j>   :wincmd j<CR>
    nnoremap <C-l>   :wincmd l<CR>
    nnoremap <C-h>   :wincmd h<CR>
elseif os == "Darwin"
    map ˚       :wincmd k<CR>
    map ∆       :wincmd j<CR>
    map ¬       :wincmd l<CR>
    map ˙       :wincmd h<CR>
endif

" alt-right and alt-left to cycle buffers in a split
map <A-right> :bnext<CR>
map <A-left>  :bprevious<CR>

" alt-up and alt-down to cycle tabs in a split
map <A-down> :tabnext<CR>
map <A-up>   :tabprevious<CR>

nnoremap <LEADER>ff :CommandTFlush<CR>
nnoremap <LEADER>t :CommandT<CR>

" Vim will ignore the following file/directory patterns
set wildignore+=lib/*,*.jar,*.war,*aspnet_client*,*.cache,*.dll,*.exe,*obj/*,*bin/*,*.jpg,*.png,*.swf,*.gif,*.bmp,*.pem,*.crt,*.keystore,*classes/*,*build/*,*dist/*,%temp%*

function! s:GenSvcProxy()
    let url = input("Enter URL of service: ")
    let namespace = input("Enter namespace for proxy class: ")
    echo system("genrefs " . namespace . " ". url)
endfunction
command! GenSvcProxy call <SID>GenSvcProxy()

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

function! s:ToCssHex(a)
ruby << EOF
VIM::message(VIM::evaluate("a:a").to_i.to_s(16))
EOF
endfunction
command! -nargs=1 ToCssHex call <SID>ToCssHex(<args>)

nmap \mj :! lein midje<CR>

if filereadable(".vim.custom")
    exe 'source' ".vim.custom"
endif
if expand('~') != getcwd()
    if filereadable(".vimrc")
        exe 'source' ".vimrc"
    endif
endif
au BufRead,BufNewFile */helpdesk/*/* set tags+=../tags

function! Refresh_hiccup()
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
autocmd BufWriteCmd *.hiccup :call Refresh_hiccup()
