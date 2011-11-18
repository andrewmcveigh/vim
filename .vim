let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <D-BS> 
imap <M-BS> 
imap <M-Down> }
inoremap <D-Down> <C-End>
imap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
inoremap <Plug>ClojureReplDownHistory :call b:vimclojure_repl.downHistory()
inoremap <Plug>ClojureReplUpHistory :call b:vimclojure_repl.upHistory()
imap <Plug>ClojureReplEvaluate GA
inoremap <Plug>ClojureReplEnterHook :call b:vimclojure_repl.enterHook()
inoremap <D-]><D-]> {<Right>%a}%a
inoremap <D-[><D-[> {
inoremap <D-]> [<Right>%a]%a
inoremap <D-[> [
inoremap <D-)> (<Right>%a)%a
inoremap <D-(> (
imap <S-Tab> <Plug>SuperTabBackward
inoremap <C-Tab> 	
map! <D-v> *
nmap 1 vip1
vmap 1 "ry :call Send_to_Named_Screen(@r, "vim-1")
nmap v :call Screen_Vars()
nmap  vip
vmap  "ry :call Send_to_Screen(@r)
nmap  vip 
vmap  "ry :call Send_to_Named_Screen(@r, "vim-2")
nmap <silent> ,b :CommandTBuffer
nnoremap ,rem :call ExtractMethod()
nnoremap ,rrr yiw(v%:s/"//gc<Left><Left><Left>
vnoremap ,jsi "zcif (z) {}=i{O
vnoremap ,jsb "zc{z}=i{bi
vnoremap ,{ "zdi{z}
vnoremap ,[ "zdi[z]
vnoremap ,( "zdi(z)
vnoremap ,' "zdi'z'
vnoremap ," "zdi"z"
vnoremap ,hh4 "zdi[z]vi]"zdi"z"%a:h4 F[i l%a 
vnoremap ,hh3 "zdi[z]vi]"zdi"z"%a:h3 F[i l%a 
vnoremap ,hh2 "zdi[z]vi]"zdi"z"%a:h2 F[i l%a 
vnoremap ,hh1 "zdi[z]vi]"zdi"z"%a:h1 F[i l%a 
vnoremap ,hli "zdi[z]vi]"zdi"z"%a:li F[i l%a 
vnoremap ,ha "zdi[z]vi]"zdi"z"%a:a F[i l%a 
vnoremap ,hp "zdi[z]vi]"zdi"z"%a:p F[i l%a 
vnoremap ,hu "zdi"z"hvi""zdi[z]vi]"zdi"z"%a:u F[i l%a 
vnoremap ,hb "zdi"z"hvi""zdi[z]vi]"zdi"z"%a:b F[i l%a 
nnoremap ,hh4 ^v$h"zdi[z]vi]"zdi"z"%a:h4 F[i l%a 
nnoremap ,hh3 ^v$h"zdi[z]vi]"zdi"z"%a:h3 F[i l%a 
nnoremap ,hh2 ^v$h"zdi[z]vi]"zdi"z"%a:h2 F[i l%a 
nnoremap ,hh1 ^v$h"zdi[z]vi]"zdi"z"%a:h1 F[i l%a 
nnoremap ,hli ^v$h"zdi[z]vi]"zdi"z"%a:li F[i l%a 
nnoremap ,hp ^v$h"zdi[z]vi]"zdi"z"%a:p F[i l%a 
nnoremap ,hb viw"zdi"z"hvi""zdi[z]vi]"zdi"z"%a:b F[i l%a 
nnoremap ,r{ ma%r}``r{
nnoremap ,r[ ma%r]``r[
nnoremap ,r( ma%r)``r(
vnoremap ,9a "zc(z  i)lxhha
vnoremap ,9I "zc(z i)lxh%i
vnoremap ,9i "zc( z i)lxh%a
nnoremap ,9a lbi(ea i )lxhha
nnoremap ,9i "zciw( )<Left>zl%a
nnoremap ,{b "zcab{ }<Left>zl%a
nnoremap ,[b "zcab[ ]<Left>zl%a
nnoremap ,9b l?[\[\{\(]ma%a)``i( i
nnoremap ,() ma%x``x
nnoremap ,90 ma%v?[\]\}\)]lx``v/[\[\{\(]hx
nmap ,- -
nmap ,= +
nmap ,cng :!cake ng
nmap ,c? mzG?Done:-zojV}kd`z
nmap ,c/ V,c/
vmap <expr> ,c/ TaskDone()
nmap ,vp :set title titlestring=ProjectView:cd ~/Dropbox/Projects:NERDTree
nmap ,vr :e ~/.vimrc
nmap ,vt :e ~/Dropbox/Sync/tasks.otl
nmap ,vg :call VimGrepInput()
vmap ,vg y :call VimGrepSelection(""")
nnoremap ,nt :NERDTree
nnoremap ,m :SplitMessage !cake midje
nnoremap ,t :CommandT
nnoremap ,ff :CommandTFlush
nmap ,,r :source $MYVIMRC
nmap gx <Plug>NetrwBrowseX
noremap <D-Down> <C-End>
noremap <D-Up> <C-Home>
noremap <D-Right> <End>
noremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <F6> :!nunit-remote
map <F5> :make
nnoremap <Plug>ClojureCloseResultBuffer :call vimclojure#ResultBuffer.CloseBuffer()
nnoremap <Plug>ClojureStartLocalRepl :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#StartRepl"), [ b:vimclojure_namespace ]])
nnoremap <Plug>ClojureStartRepl :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#StartRepl"), [  ]])
nnoremap <Plug>ClojureEvalParagraph :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#EvalParagraph"), [  ]])
nnoremap <Plug>ClojureEvalToplevel :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#EvalToplevel"), [  ]])
vnoremap <Plug>ClojureEvalBlock :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#EvalBlock"), [  ]])
nnoremap <Plug>ClojureEvalLine :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#EvalLine"), [  ]])
nnoremap <Plug>ClojureEvalFile :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#EvalFile"), [  ]])
nnoremap <Plug>ClojureMacroExpand1 :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#MacroExpand"), [ 1 ]])
nnoremap <Plug>ClojureMacroExpand :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#MacroExpand"), [ 0 ]])
nnoremap <Plug>ClojureRunTests :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#RunTests"), [ 0 ]])
nnoremap <Plug>ClojureRequireFileAll :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#RequireFile"), [ 1 ]])
nnoremap <Plug>ClojureRequireFile :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#RequireFile"), [ 0 ]])
nnoremap <Plug>ClojureGotoSourceInteractive :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#GotoSource"), [ input("Symbol to go to: ") ]])
nnoremap <Plug>ClojureGotoSourceWord :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#GotoSource"), [ expand("<cword>") ]])
nnoremap <Plug>ClojureSourceLookupInteractive :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#SourceLookup"), [ input("Symbol to look up: ") ]])
nnoremap <Plug>ClojureSourceLookupWord :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#SourceLookup"), [ expand("<cword>") ]])
nnoremap <Plug>ClojureMetaLookupInteractive :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#MetaLookup"), [ input("Symbol to look up: ") ]])
nnoremap <Plug>ClojureMetaLookupWord :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#MetaLookup"), [ expand("<cword>") ]])
nnoremap <Plug>ClojureFindDoc :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#FindDoc"), [  ]])
nnoremap <Plug>ClojureJavadocLookupInteractive :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#JavadocLookup"), [ input("Class to lookup: ") ]])
nnoremap <Plug>ClojureJavadocLookupWord :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#JavadocLookup"), [ expand("<cword>") ]])
nnoremap <Plug>ClojureDocLookupInteractive :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#DocLookup"), [ input("Symbol to look up: ") ]])
nnoremap <Plug>ClojureDocLookupWord :call vimclojure#ProtectedPlug( function("vimclojure#CommandPlug"), [ function("vimclojure#DocLookup"), [ expand("<cword>") ]])
nnoremap <Plug>ClojureToggleParenRainbow :call vimclojure#ProtectedPlug(function("vimclojure#ToggleParenRainbow"), [  ])
nnoremap <Plug>ClojureAddToLispWords :call vimclojure#ProtectedPlug(function("vimclojure#AddToLispWords"), [ expand("<cword>") ])
nnoremap <silent> <F11> :call conque_term#exec_file()
map <M-Up> :tabprevious
map <M-Down> :tabnext
map <M-Left> :bprevious
map <M-Right> :bnext
map <D-H> :wincmd h
map <D-L> :wincmd l
map <D-J> :wincmd j
map <D-K> :wincmd k
map <Left> :wincmd h
map <Right> :wincmd l
map <Down> :wincmd j
map <Up> :wincmd k
vmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
imap 	 <Plug>SuperTabForward
imap  <Plug>SuperTabForward
imap  <Plug>SuperTabBackward
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
let &cpo=s:cpo_save
unlet s:cpo_save
set autowrite
set background=dark
set backspace=indent,eol,start
set backupdir=~/.temp/backup//
set directory=~/.temp/swp//
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set grepprg=grep\ -nH\ $*
set guifont=Monaco:h13
set guioptions=egmt
set guitablabel=%M%t
set helplang=en
set langmenu=none
set lispwords=def,def-,defn,defn-,defmacro,defmacro-,defmethod,defmulti,defonce,defvar,defvar-,defunbound,let,fn,letfn,binding,proxy,defnk,definterface,defprotocol,deftype,defrecord,reify,extend,extend-protocol,extend-type,bound-fn,if,if-not,if-let,when,when-not,when-let,when-first,condp,case,loop,dotimes,for,while,do,doto,try,catch,locking,with-in-str,with-out-str,with-open,dosync,with-local-vars,doseq,dorun,doall,->,->>,future,with-bindings,ns,clojure.core/ns,gen-class,gen-interface
set listchars=eol:$,tab:»-,trail:·,eol:¶
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set runtimepath=~/.vim/bundle/Conque-Shell,~/.vim/bundle/reload.vim,~/.vim/bundle/SuperTab-continued.,~/.vim/bundle/The-NERD-tree,~/.vim/bundle/Solarized,~/.vim/bundle/css-color-preview,~/.vim/bundle/BufOnly.vim,~/.vim/bundle/fugitive.vim,~/.vim/bundle/indentpython.vim--nianyang,~/.vim/bundle/vim-customizations,~/.vim/bundle/vimclojure-bundle,~/.vim/bundle/Command-T,~/.vim/bundle/vimoutliner,~/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,~/.vim/after,~/.vim/vundle,~/.vim/bundle/vimoutliner/after,~/.vim/bundle/Command-T/after,~/.vim/bundle/vimclojure-bundle/after,~/.vim/bundle/vim-customizations/after,~/.vim/bundle/indentpython.vim--nianyang/after,~/.vim/bundle/fugitive.vim/after,~/.vim/bundle/BufOnly.vim/after,~/.vim/bundle/css-color-preview/after,~/.vim/bundle/Solarized/after,~/.vim/bundle/The-NERD-tree/after,~/.vim/bundle/SuperTab-continued./after,~/.vim/bundle/reload.vim/after,~/.vim/bun
set scrolloff=5
set secure
set shiftwidth=4
set softtabstop=4
set spelllang=en_gb
set statusline=%!MyStatusLine('Enter')
set tags=tags;/
set termencoding=utf-8
set titlestring=ProjectView
set transparency=10
set visualbell
set wildignore=lib/*,*.jar,*.war,*aspnet_client*,*.cache,*.dll,*.exe,*obj/*,*bin/*,*.jpg,*.png,*.swf,*.gif,*.bmp,*.pem,*.crt,*.keystore,*classes/*,*build/*,*dist/*,%temp%*,log*,Jit*,*.pyc
set window=80
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Dropbox/Projects/eu.interel.xwiki.notifications
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +92 src/eu/interel/xwiki/notifications/core.clj
badd +20 src/eu/interel/xwiki/notifications/plugin.clj
badd +10 project.clj
badd +1 event_html_diff.txt
badd +36 ../eu.interel.xwiki.authentication/src/eu/interel/xwiki/authentication/ip_address.clj
badd +0 ~/.vimrc
silent! argdel *
edit ~/.vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 26 + 40) / 81)
exe 'vert 1resize ' . ((&columns * 212 + 159) / 319)
exe '2resize ' . ((&lines * 26 + 40) / 81)
exe 'vert 2resize ' . ((&columns * 212 + 159) / 319)
exe '3resize ' . ((&lines * 25 + 40) / 81)
exe 'vert 3resize ' . ((&columns * 212 + 159) / 319)
exe 'vert 4resize ' . ((&columns * 106 + 159) / 319)
argglobal
edit /Applications/MacVim.app/Contents/Resources/vim/runtime/doc/eval.txt
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal nobuflisted
setlocal buftype=help
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=nc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'help'
setlocal filetype=help
endif
setlocal foldcolumn=0
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=!-~,^*,^|,^\",192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal readonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=en_gb
setlocal statusline=%!MyStatusLine('Leave')
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'help'
setlocal syntax=help
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 3656 - ((5 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3656
normal! 029l
wincmd w
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=en_gb
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 366 - ((24 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
366
normal! 011l
wincmd w
argglobal
edit src/eu/interel/xwiki/notifications/plugin.clj
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> <silent> ,p <Plug>ClojureCloseResultBuffer
nmap <buffer> <silent> ,sR <Plug>ClojureStartLocalRepl
nmap <buffer> <silent> ,sr <Plug>ClojureStartRepl
nmap <buffer> <silent> ,ep <Plug>ClojureEvalParagraph
nmap <buffer> <silent> ,et <Plug>ClojureEvalToplevel
vmap <buffer> <silent> ,eb <Plug>ClojureEvalBlock
nmap <buffer> <silent> ,el <Plug>ClojureEvalLine
nmap <buffer> <silent> ,ef <Plug>ClojureEvalFile
nmap <buffer> <silent> ,m1 <Plug>ClojureMacroExpand1
nmap <buffer> <silent> ,me <Plug>ClojureMacroExpand
nmap <buffer> <silent> ,rt <Plug>ClojureRunTests
nmap <buffer> <silent> ,rF <Plug>ClojureRequireFileAll
nmap <buffer> <silent> ,rf <Plug>ClojureRequireFile
nmap <buffer> <silent> ,gi <Plug>ClojureGotoSourceInteractive
nmap <buffer> <silent> ,gw <Plug>ClojureGotoSourceWord
nmap <buffer> <silent> ,si <Plug>ClojureSourceLookupInteractive
nmap <buffer> <silent> ,sw <Plug>ClojureSourceLookupWord
nmap <buffer> <silent> ,mi <Plug>ClojureMetaLookupInteractive
nmap <buffer> <silent> ,mw <Plug>ClojureMetaLookupWord
nmap <buffer> <silent> ,fd <Plug>ClojureFindDoc
nmap <buffer> <silent> ,ji <Plug>ClojureJavadocLookupInteractive
nmap <buffer> <silent> ,jw <Plug>ClojureJavadocLookupWord
nmap <buffer> <silent> ,li <Plug>ClojureDocLookupInteractive
nmap <buffer> <silent> ,lw <Plug>ClojureDocLookupWord
nmap <buffer> <silent> ,tr <Plug>ClojureToggleParenRainbow
nmap <buffer> <silent> ,aw <Plug>ClojureAddToLispWords
cnoremap <buffer> <expr>  fugitive#buffer().rev()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:;\ -,mO:;\ \ ,n:;
setlocal commentstring=;%s
setlocal complete=.,w,b,u,t,i,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.core.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.inspector.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.browse.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.io.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.javadoc.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.shell.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.main.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.pprint.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.repl.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.set.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.stacktrace.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.string.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.template.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.test.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.test.tap.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.test.junit.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.walk.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.xml.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.zip.txt
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*(def\\(-|n|n-|macro|struct|multi\\)?
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'clojure'
setlocal filetype=clojure
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetClojureIndent()
setlocal indentkeys=!,o,O
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,?,-,*,!,+,/,=,<,>,.,:
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=vimclojure#OmniCompletion
setlocal path=.,/usr/include,,,src
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=en_gb
setlocal statusline=%!MyStatusLine('Leave')
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'clojure'
setlocal syntax=clojure
endif
setlocal tabstop=8
setlocal tags=tags;/,~/Dropbox/Projects/eu.interel.xwiki.notifications/.git/clojure.tags,~/Dropbox/Projects/eu.interel.xwiki.notifications/.git/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 20 - ((6 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 018l
wincmd w
argglobal
enew
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> <silent> ,sR <Plug>ClojureStartLocalRepl
nmap <buffer> <silent> ,sr <Plug>ClojureStartRepl
nmap <buffer> <silent> ,ep <Plug>ClojureEvalParagraph
nmap <buffer> <silent> ,et <Plug>ClojureEvalToplevel
vmap <buffer> <silent> ,eb <Plug>ClojureEvalBlock
nmap <buffer> <silent> ,el <Plug>ClojureEvalLine
nmap <buffer> <silent> ,ef <Plug>ClojureEvalFile
nmap <buffer> <silent> ,m1 <Plug>ClojureMacroExpand1
nmap <buffer> <silent> ,me <Plug>ClojureMacroExpand
nmap <buffer> <silent> ,rt <Plug>ClojureRunTests
nmap <buffer> <silent> ,rF <Plug>ClojureRequireFileAll
nmap <buffer> <silent> ,rf <Plug>ClojureRequireFile
nmap <buffer> <silent> ,gi <Plug>ClojureGotoSourceInteractive
nmap <buffer> <silent> ,gw <Plug>ClojureGotoSourceWord
nmap <buffer> <silent> ,si <Plug>ClojureSourceLookupInteractive
nmap <buffer> <silent> ,sw <Plug>ClojureSourceLookupWord
nmap <buffer> <silent> ,mi <Plug>ClojureMetaLookupInteractive
nmap <buffer> <silent> ,mw <Plug>ClojureMetaLookupWord
nmap <buffer> <silent> ,fd <Plug>ClojureFindDoc
nmap <buffer> <silent> ,ji <Plug>ClojureJavadocLookupInteractive
nmap <buffer> <silent> ,jw <Plug>ClojureJavadocLookupWord
nmap <buffer> <silent> ,li <Plug>ClojureDocLookupInteractive
nmap <buffer> <silent> ,lw <Plug>ClojureDocLookupWord
nmap <buffer> <silent> ,tr <Plug>ClojureToggleParenRainbow
nmap <buffer> <silent> ,aw <Plug>ClojureAddToLispWords
nmap <buffer> <silent> ,p <Plug>ClojureCloseResultBuffer
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=wipe
setlocal buflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:;\ -,mO:;\ \ ,n:;
setlocal commentstring=;%s
setlocal complete=.,w,b,u,t,i,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.core.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.inspector.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.browse.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.io.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.javadoc.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.java.shell.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.main.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.pprint.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.repl.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.set.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.stacktrace.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.string.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.template.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.test.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.test.tap.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.test.junit.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.walk.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.xml.txt,k/Users/andrewmcveigh/.vim/bundle/vimclojure-bundle/ftplugin/clojure/completions-clojure.zip.txt
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*(def\\(-|n|n-|macro|struct|multi\\)?
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'clojure'
setlocal filetype=clojure
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetClojureIndent()
setlocal indentkeys=!,o,O
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,?,-,*,!,+,/,=,<,>,.,:
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=vimclojure#OmniCompletion
setlocal path=.,/usr/include,,,src
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=en_gb
setlocal statusline=%!MyStatusLine('Leave')
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'clojure'
setlocal syntax=clojure
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 26 + 40) / 81)
exe 'vert 1resize ' . ((&columns * 212 + 159) / 319)
exe '2resize ' . ((&lines * 26 + 40) / 81)
exe 'vert 2resize ' . ((&columns * 212 + 159) / 319)
exe '3resize ' . ((&lines * 25 + 40) / 81)
exe 'vert 3resize ' . ((&columns * 212 + 159) / 319)
exe 'vert 4resize ' . ((&columns * 106 + 159) / 319)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
