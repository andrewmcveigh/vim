
" Vundle setup {{{

set rtp+=~/.vim/vundle
call vundle#rc()

" Bundles {{{

Bundle 'Conque-Shell'
Bundle 'reload.vim'
Bundle 'DirDiff.vim'
Bundle 'SuperTab-continued.'
Bundle 'The-NERD-tree'
Bundle 'Solarized'
Bundle 'BufOnly.vim'
Bundle 'fugitive.vim'
Bundle 'indentpython.vim--nianyang'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'Tagbar'
Bundle 'VimOrganizer'
Bundle 'Gundo'

" Custom Bundles {{{

Bundle 'andrewmcveigh/vim-customizations'
Bundle 'andrewmcveigh/vimclojure-bundle'
Bundle 'andrewmcveigh/Command-T'
Bundle 'andrewmcveigh/paredit.vim'

" }}}

" Bundles in exile {{{

" Bundle 'snipMate'
" Bundle 'rails.vim'
" Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
" Bundle 'cocoa.vim'
" Bundle 'jQuery'
" Bundle 'jslint.vim'

" }}}

" }}}

" }}}

" Vim set options {{{

set autowrite                   " autosave before make/change buffer
set softtabstop=4               " default tabstop width 4
set shiftwidth=4                " default shift width 4
set noautoindent                " auto indent off
set nosmartindent               " smart indent off
set expandtab                   " tabs render as spaces
set number                      " line numbers on
set guioptions-=l               " disable gui chrome
set guioptions-=L               " "
set guioptions-=r               " "
set guioptions-=R               " "
set guioptions-=b               " "
set guioptions-=B               " "
set guioptions-=T               " "
set modeline                    " enable modelines
set scrolloff=5                 " scroll offset 5 lines, I.E., keep 5 lines (minimum) above/below cursor
set tags=tags;/                 " find tags file in current dir, or the next one up the tree
set visualbell
set hlsearch
set incsearch
set spelllang=en_gb
set listchars+=tab:»-,trail:·,eol:¶
set list
set t_Co=256                    " 256 Terminal colors
set background=dark
set wildmenu
set wildmode=full

" }}}

" Global plugin settings {{{

" I just want paredit
let g:slimv_loaded = 1
let g:slimv_clojure_loaded = 1
let b:did_indent = 1
let b:current_syntax = 1

" }}}

" Filetype {{{

filetype plugin on              " filetype plugin on
filetype indent on              " filetype indent on

" }}}

" Colorscheme {{{

" Solarized options {{{

let g:solarized_visibility="high"
let g:solarized_contrast="high"

" }}}

colorscheme solarized

" }}}

" Set os var to name of current OS {{{

let os = substitute(system('uname'), "\n", "", "")

" }}}

" Omnifunc commands {{{

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Ruby {{{

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" }}}

" }}}

" Display settings {{{

set guifont=Monaco:h13

if has("gui_running")
    set transparency=10
endif

" Make cursor more visible
if &background == 'light'
    hi Cursor term=bold ctermfg=White ctermbg=Black guifg=White guibg=Black gui=bold
else
    hi Cursor term=bold ctermfg=Black ctermbg=White guifg=Black guibg=White gui=bold
endif

" highlight red line segments that are > 120 chars long
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%121v.\+/
if has("gui_running")
    set colorcolumn=80
endif

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" }}}

" Autocommands {{{

" Filetype autocommands {{{

au BufRead,BufNewFile *.js set ft=javascript.jquery
au BufRead,BufNewFile *.mpl set filetype=mpl
au BufRead,BufNewFile *.otl setlocal ft=vo foldlevel=0
au BufRead,BufNewFile *.pp setlocal filetype=puppet
au BufRead,BufNewFile *.txt setlocal filetype=text

" }}}

" }}}

" Supertab settings {{{

let g:SuperTabDefaultCompletionTypeDiscovery = [ "&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>", ]
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

" }}}

" Vimrc settings {{{

" Allows a per-directory .vimrc or .vim.custom
if filereadable('.custom.vim')
    source .custom.vim
endif

" }}}

" Latex settings {{{

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" }}}

" Move swp files so they don't clutter up the current dir {{{

set backupdir=~/.temp/backup//
set directory=~/.temp/swp//

" }}}

" Vim will ignore the following file/directory patterns {{{

set wildignore+=lib/*,*.jar,*.war,*aspnet_client*,*.cache,*.dll,*.exe,*obj/*,*bin/*,*.jpg,*.png,*.swf,*.gif,*.bmp,*.pem
set wildignore+=*.crt,*.keystore,*classes/*,*build/*,*dist/*,%temp%*,log*,Jit*,*.pyc,target/*

" }}}

" Statusline Magic {{{

hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

" Statusline functions {{{

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction 

" }}}

set statusline=%!MyStatusLine('Enter')

" Status line autocommands {{{

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

" }}}

" }}}

" Global functions {{{

" The start of a int -> hex converter, works for small ints
function! s:ToCssHex(a)
ruby << EOF
VIM::message(VIM::evaluate("a:a").to_i.to_s(16))
EOF
endfunction

function! Refresh_firefox()
    silent !echo  'vimYo = content.window.pageYOffset;
                \ vimXo = content.window.pageXOffset;
                \ BrowserReload();
                \ content.window.scrollTo(vimXo,vimYo);
                \ repl.quit();'  |
                \ nc localhost 4242 2>&1 > /dev/null
endfunction

function! SplitMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  split new
  silent put=message
  set nomodified
endfunction

function! VimGrepInput()
    let search = input("VimGrep: ")
    call VimGrepSelection(search)
endfunction

function! VimGrepSelection(value)
    exec "vimgrep /".a:value."/g **/*.".expand("%:e")
    exec "normal \<A-LEFT>\<A-LEFT>\<C-^>:cw\<CR>"
endfunction

function! CakeReload()
    exec "!cake killall"
    sleep 1
    exec "!cake ng" 
endfunction
function! CakeDepsReload()
    exec "!cake deps"
    call CakeReload()
endfunction

function! TaskDone()
    let range = getpos("'>")[1] - getpos("'<")[1]
    if range < 0
        let range = range * -1
    endif
    return "dmzG?Done:-\<CR>zo}kpV".range."j=`z"
endfunction

function! NewClojureProject()
    let type = input('Project Type [default]: ')
    let name = input('Project Name: ')
"   execute 'set title titlestring=ProjectView'
    execute 'cd ~/Dropbox/Projects'
    execute '!cake new '.type.' '.name
    execute 'cd '.name
    let dir = substitute(join(split(name, '\.'), '/'), '-', '_', 'g')
    execute '!mkdir -p src/'.dir
    let name = substitute(name,'-','_','g')
    execute '!mv src/'.name.'/core.clj src/'.dir
    execute '!rm -r src/'.name
    execute '!git init'
    execute '!killall java && cake deps && cake ng'
    execute 'CommandTFlush'
endfunction

function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

function! Base64Decode()
    normal ggVG"zd
    let @z = system("openssl base64 -d", @z)
    normal "zp
endfunction

function! PrettyPrintHTML()
python << endpython
from BeautifulSoup import BeautifulSoup
import vim
vim.current.buffer[:] = BeautifulSoup('\n'.join(vim.current.buffer)).prettify().split('\n')
#vim.current.buffer.append(bs('\n'.split('\n'.join(vim.current.buffer))).prettify())
endpython
endfunction

function! SaveSession()
    let session_name = input("Save Session Name: ", "default")
    exec "mksession ~/.vim/".session_name.".vim"
endfunction

function! LoadSession()
    let session_name = input("Load Session Name: ", "default")
    exec "so ~/.vim/".session_name.".vim"
endfunction

function! LoadProject()
    normal cdq
    if filereadable('.custom.vim')
        exec "source .custom.vim"
    endif
    exec "CommandTFlush"
endfunction

" }}}

" Global commands {{{

command! -nargs=+ -complete=command SplitMessage call SplitMessage(<q-args>)
command! CakeReload call CakeReload()
command! CakeDepsReload call CakeDepsReload()
command! -nargs=* NClojureProject call NewClojureProject()
command! -bar Hexmode call ToggleHex()
command! Base64Decode call Base64Decode()
command! PrettyPrintHTML call PrettyPrintHTML()
command! -nargs=1 ToCssHex call <SID>ToCssHex(<args>)

" }}}

" Global mappings {{{

let mapleader = ","
let maplocalleader = ","

nnoremap \ ,
nnoremap <LEADER>,r :source $MYVIMRC<CR>
nnoremap <LEADER>ff :CommandTFlush<CR>
nnoremap <LEADER>t :CommandT<CR>
nnoremap <LEADER>m :SplitMessage !cake midje<CR>
nnoremap <LEADER>nt :NERDTree<CR>
vnoremap <LEADER>vg y :call VimGrepSelection("<C-R>"")<CR>
nnoremap <LEADER>vg :call VimGrepInput()<CR>
nnoremap <LEADER>vr :e ~/.vimrc<CR>
nnoremap <LEADER>vp :set title titlestring=ProjectView<CR>:cd ~/Dropbox/Projects<CR>:NERDTree<CR>
vnoremap <expr> <LEADER>c/ TaskDone()
nnoremap <LEADER>c/ V,c/
nnoremap <LEADER>c? mzG?Done:-<CR>zojV}kd`z
nnoremap <LEADER>cng :!cake ng<CR>
nnoremap <LEADER>= <C-W>+
nnoremap <LEADER>- <C-W>-
cnoremap <M-BS> <C-w>
nnoremap <F13> :call SaveSession()<CR>
vnoremap <F13> :call SaveSession()<CR>
inoremap <F13> :call SaveSession()<CR>
cnoremap <F13> :call SaveSession()<CR>
nnoremap <F14> :call LoadSession()<CR>
vnoremap <F14> :call LoadSession()<CR>
inoremap <F14> :call LoadSession()<CR>
cnoremap <F14> :call LoadSession()<CR>
nnoremap <silent> <esc> :nohl<return><esc>

" Move windows with arrow keys, or Command+hljk {{{

nnoremap <up>    :wincmd k<CR>
nnoremap <down>  :wincmd j<CR>
nnoremap <right> :wincmd l<CR>
nnoremap <left>  :wincmd h<CR>
nnoremap <D-k>   :wincmd k<CR>
nnoremap <D-j>   :wincmd j<CR>
nnoremap <D-l>   :wincmd l<CR>
nnoremap <D-h>   :wincmd h<CR>

" }}}

" Command-right/left to cycle buffers in a split {{{

nnoremap <D-S-right> :bnext<CR>
nnoremap <D-S-left>  :bprevious<CR>

" }}}

" Command-up/down to cycle tabs in a split {{{

nnoremap <A-down> :tabnext<CR>
nnoremap <A-up>   :tabprevious<CR>

" }}}

" }}}

" vim:foldlevel=0:foldmethod=marker:foldmarker={{{,}}}