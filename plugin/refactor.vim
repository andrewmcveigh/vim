" Vim script
" Last Change: Sept 15, 2010
" Author: Andrew Mcveigh
" URL: http://andrewmcveigh.com
" License: ---
" Version: 0.1
" Uses closepairs.vim as a starting point

nnoremap <LEADER>hb viw"zdi"<C-R>z"<ESC>hvi""zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:b <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hp ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:p <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hli ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:li <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh1 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h1 <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh2 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h2 <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh3 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h3 <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh4 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h4 <ESC>F[i <ESC>l%a <ESC>

vnoremap <LEADER>hb "zdi"<C-R>z"<ESC>hvi""zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:b <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hu "zdi"<C-R>z"<ESC>hvi""zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:u <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hp "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:p <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>ha "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:a <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hli "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:li <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh1 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h1 <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh2 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h2 <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh3 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h3 <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh4 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h4 <ESC>F[i <ESC>l%a <ESC>

function! s:CommentOut()
  if g:ft_check == "clojure"
    return " ?[\[\{\(]\<CR>ma%a)\<ESC>``i(comment \<ESC>:nohl"
  endif
endfunction

" vim: ts=2 sw=2 softtabstop=2 et 
if !exists('g:ft_check')
  let g:ft_check = ""
endif

au FileType clojure let g:ft_check = "clojure"
au FileType javascript let g:ft_check = "javascript"
au FileType javascript.jquery let g:ft_check = "javascript"
au FileType cs let g:ft_check = "csharp"

nmap <expr> <LEADER>rrg <SID>GlobalRename()
vnoremap <LEADER>jsb "zc{<CR><C-R>z}<ESC>=i{bi
vnoremap <LEADER>jsi "zcif (<C-R>z) {<CR>}<ESC>=i{O

nnoremap <LEADER>rrr yiw(v%:s/<C-R>"//gc<LEFT><LEFT><LEFT>

function! FindNextBracketBackward(line_nr, column)
  call search('\v[\(\[\{]', 'b')
  normal %
  if getpos('.')[1] < a:line_nr || (getpos('.')[1] <= a:line_nr && col('.') < a:column)
    normal %
    call FindNextBracketBackward(a:line_nr, a:column)
  endif
endfunction

function! FindBracket()
    let line = getline('.')
    let line_nr = getpos('.')[1]
    let column = col('.')
    " if not on a bracket
    if index(['(',')','[',']','{','}'], line[column - 1]) <= -1
        call FindNextBracketBackward(line_nr, column)
    endif
    nohl
endfunction

function! ExtractFunctionClj()
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  call FindBracket()
  let space = empty(params) ? "" : " "
  silent exec "normal \"zc%(".name.space.params.")\<ESC>{o(defn ".name." [".params."]\<CR>\<C-R>z)\<CR>\<ESC>kvip=/(".name.space.params.")\<CR>"
endfunction

function! ExtractFunctionClj()
  let name = input("Name of new method: ")
  let params = input("Params to accept: ")
  let pass = params
  if (match(params, '[\[\{\}\]]') > -1)
    let pass = input("Params to pass: ")
    let params = substitute(params, '\s\([\[\{]\)', '\1', 'g')
  endif
  call FindBracket()
  let space = empty(params) ? "" : " "
  silent exec "normal v%\"zc(".name.space.pass.")\<ESC>%lmy[[O(defn ".name."[".params."\<ESC>[[%i\<CR>\<C-R>z)\<CR>\<ESC>kvip=`y"
endfunction

function! DefThisSExp()
  let name = input("Name of def: ")
  call FindBracket()
  silent exec "normal \"zc%".name."\<ESC>{o(def ".name."\<CR>\<C-R>z)\<CR>\<ESC>kvip=/".name."\<CR>*"
endfunction

function! ExtractMethodCSharp()
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  exe "\"+d?public void<CR>/{<CR>%o<CR>public void ".name."() {<ESC>po}"
endfunction

function! ExtractFunctionJS(text, lastchar)
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  let visual_line = !empty(matchstr(a:text, '\c\n$'))
  let returnstr = ""
  if a:lastchar == "="
    let returnstr = "return "
  endif
  if visual_line
    exe "normal! O_this." . name . "(" . params . ");\<ESC>?this\..*{\nOthis." . name . " = function(" . params .") {};\<ESC>hi\<CR>" . returnstr . a:text . "\<ESC>vip=f{%o"
  else
    exe "normal! a _this." . name . "(" . params . ");\<CR>\<ESC>?this\..*{\nOthis." . name . " = function(" . params .") {};\<ESC>hi\<CR>" . returnstr . a:text . "\<CR>\<ESC>vip=f{%o"
  endif
endfunction

if g:ft_check == "javascript"
  vmap <LEADER>rem "rd?\S<CR>"ly :call ExtractFunctionJS(@r, @l)<CR>
endif

function! ExtractMethod()
  if g:ft_check == "clojure"
    call ExtractFunctionClj()
  elseif g:ft_check == "csharp"
    call ExtractMethodCSharp()
  endif
endfunction

nnoremap <LEADER>rem :call ExtractMethod()<CR>
nmap <LEADER>def :call DefThisSExp()<CR>


function! s:GlobalRename()
  let new_name = input("Global Rename:- new name of symbol?: ")
  return "gD:%s/\<C-R>//" . new_name . "/gc\<CR>"
endfunction

function! ReorderParams(params)
  let params = split(a:params, ',\s')
  let order = input(string(map(copy(params), 'v:key + 1 . ": " . v:val')))
  let @" = join(map(split(order, '[0-9]\zs'), 'params[str2nr(v:val) - 1]'), ', ')
  normal P
endfunction
nmap <LEADER>rrp di(:call ReorderParams(@")<CR>

" vim: ts=2 sw=2 softtabstop=2 et 
