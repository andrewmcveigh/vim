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

function! ExtractFunctionClj()
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  exe "normal! l?[\\[\\{\\(]\<CR>\"ac%(" . name . " " . params . ")\<ESC>{O\<ESC>jo\<ESC>kI(defn " . name . " [" . params . "]\<CR>\<ESC>\"ap}kA)\<ESC>vip="
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
    call ExtractFunctionClj()<CR>
  elseif g:ft_check == "csharp"
    call ExtractMethodCSharp()<CR>
  endif
endfunction

nnoremap <LEADER>rem :call ExtractMethod()<CR>


function! s:GlobalRename()
  let new_name = input("Global Rename:- new name of symbol?: ")
  return "gD:%s/\<C-R>//" . new_name . "/gc\<CR>"
endfunction

" vim: ts=2 sw=2 softtabstop=2 et 
