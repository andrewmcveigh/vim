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

inoremap <D-[> <ESC>%mm%i[<ESC>`mla]<ESC>%a<SPACE><ESC>i

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

let s:last_letted_form = ""
let s:last_letted_symbol = ""

function! refactor#kill_pair()
  let g:paredit_mode = 0
  let pos = getpos('.')
  normal %x
  call setpos('.', pos)
  normal x
  let g:paredit_mode = 1
endfunction

function! refactor#replace_with_parens()
  let g:paredit_mode = 0
  let pos = getpos('.')
  normal %r)
  call setpos('.', pos)
  normal r(
  let g:paredit_mode = 1
endfunction

function! refactor#let_outer_form()
  let s:last_letted_symbol = input("Name of symbol to let: ")
  let binding = s:last_letted_symbol
  if (match(binding, '[\[\{\}\]]') > -1)
    if (match(binding, '^.*:as\s\+\(\w\+\).*$') > -1)
      let binding = substitute(binding, '^.*:as\s\+\(\w\+\).*$', '\1', 'g')
    else
      let binding = ""
    endif
  endif
  call FindBracket()
  exec "normal mzW\"tyi(`zalet[".s:last_letted_symbol."\<ESC>l>a\<CR>".binding."\<ESC>Jk$=%`z"
  let s:last_letted_form = @t
  echo s:last_letted_form
endfunction

function! refactor#is_in_let_block()
  let curr_line = getline('.')
  let column = col('.')
  let curr_char = curr_line[column -1]
  if curr_char == '(' && curr_line[column : column + 2] == 'let'
    return 1
  elseif curr_char == 'l' && curr_line[column : column + 1] == 'et'
    return 2
  else
    let pos = getpos('.')
    call search('let', 'b')
    call search('[(\{\[]', 'b')
    let let_pos = getpos('.')
    normal %
    let let_end_pos = getpos('.')
    call setpos('.', pos)
    if let_end_pos[1] > pos[1]
      return 3
    elseif let_end_pos[1] == pos[1] && let_end_pos[2] >= pos[2]
      return 3
    else
      return 0
    endif
  endif
endfunction

function! refactor#jump_to_let(let_value)
  if a:let_value == 2
    normal h
  elseif a:let_value == 3
    call search('let', 'b')
    call search('[(\{\[]', 'b')
  endif
endfunction

function! refactor#join_til_same_line ()
  let s = getpos('.')
  normal %
  let e = getpos('.')
  if s[1] != e[1]
    if s[1] < e[1]
      call setpos('.', s)
      normal J
      call setpos('.', s)
      call refactor#join_til_same_line()
    else
      call setpos('.', e)
      normal J
      call setpos('.', e)
      call refactor#join_til_same_line()
    endif
  else
    if s[2] <= e[2]
      call setpos('.', s)
    else 
      call setpos('.', e)
    endif
  endif
endfunction

function! refactor#slurp_bracket(bracket_char)
  call refactor#kill_pair()
  normal h
  call refactor#replace_with_parens()
  normal l
  let pos = getpos('.')
  normal d%
  let tmp = @"
  normal =%
  call setpos('.', pos)
  normal vi(x
  let inner_text = split(@", '\v[\r\n]+')
  call refactor#join_til_same_line()
  let start_bracket_pos = getpos('.')
  let lines = []
  for l in inner_text
    let lines += [substitute(substitute(l, '\v^\s+', '', 'g'), s:last_letted_form, s:last_letted_symbol, 'g')]
  endfor
  let @" = join(lines, "\n")
  execute "normal a".a:bracket_char."\<ESC>p"
  call setpos('.', start_bracket_pos)
  let @" = tmp
  normal pa
  normal =%
  call setpos('.', start_bracket_pos)
endfunction

function! refactor#is_after(pos, is_after)
  if ((a:pos[1] == a:is_after[1] && a:pos[2] <= a:is_after[2]) || (a:pos[1] < a:is_after[1]))
    return 1
  else
    return 0
  endif
endfunction

function! refactor#is_before(pos, is_before)
  if ((a:pos[1] == a:is_before[1] && a:pos[2] >= a:is_before[2]) || (a:pos[1] > a:is_before[1]))
    return 1
  else
    return 0
  endif
endfunction

function! refactor#is_within(pos_a, pos_b, test)
  if refactor#is_after(a:pos_a, a:test) == 1 && refactor#is_before(a:pos_b, a:test) == 1
    return 1
  else
    return 0
  endif
endfunction

function! refactor#get_comments(pos_a, pos_b, comments)
  let comms = a:comments
  let next_comment = search('\v\s+;.*$')
  if next_comment > 0
    let pos = getpos('.')
    if refactor#is_within(a:pos_a, a:pos_b, pos)
      normal D
      return refactor#get_comments(a:pos_a, a:pos_b, a:comments + [[pos, @"]])
    else
      return a:comments
    endif
  else
    return a:comments
  endif
endfunction

function! refactor#strip_comments()
  let return_pos = getpos('.')
  let let_val = refactor#is_in_let_block()
  call refactor#jump_to_let(let_val)
  let start = getpos('.')
  normal %
  let end = getpos('.')
  call setpos('.', start)
  let comments = refactor#get_comments(start, end, [])
  call setpos('.', return_pos)
  return comments
endfunction

function! refactor#place_comments(comments)
  let pos = getpos('.')
  for com1 in a:comments
    call setpos('.', com1[0])
    let @" = com1[1]
    normal $p
  endfor
  call setpos('.', pos)
endfunction

function! refactor#slurp_let_back()
  let format_opts = &formatoptions
  let &formatoptions = ""
  let comments = refactor#strip_comments()
  let curr_line = getline('.')
  let column = col('.')
  let curr_char = curr_line[column -1]
  let let_val = refactor#is_in_let_block()
  if let_val
    call refactor#jump_to_let(let_val)
    let pos = getpos('.')
    let back_1_sym = getline('.')[col('.')-2]
    if back_1_sym == '(' || back_1_sym == '[' || back_1_sym == '{'
      call refactor#slurp_bracket(back_1_sym)
    else
      let @x = ""
      normal lv%"xx<
      let pos = getpos('.')
      normal dib"xP
      call refactor#jump_to_let(refactor#is_in_let_block())
      let @" = substitute(@", s:last_letted_form, s:last_letted_symbol, 'g')
      normal l%a"
      normal kJJ
    endif
    call setpos('.', pos)
    normal =%
    call search('let')
    normal h
  endif
  "call refactor#place_comments(comments)
  let &formatoptions = format_opts
endfunction

function! refactor#barf_let_forward()
  normal lv%"xdJxh=%>"xphhr^=%
endfunction

nmap <D-<> :call refactor#slurp_let_back()<CR>
nmap <D->> :call refactor#barf_let_forward()<CR>
nmap <LEADER>let :call refactor#let_outer_form()<CR>

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
