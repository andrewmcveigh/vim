
if !exists('g:load_pairs')
  let g:load_pairs = 1
endif

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

nnoremap <LEADER>90 ma%v?[\]\}\)]<CR>lx``v/[\[\{\(]<CR>hx:nohl<CR>
nnoremap <LEADER>() ma%x``x

nnoremap <LEADER>i( :call FindBracket()<CR>"zc%( <C-R>z)<ESC>%mz=%`za
nnoremap <LEADER>i) :call FindBracket()<CR>"zc%(<C-R>z )<ESC>mz=%`zi
nnoremap <LEADER>i9 :call FindBracket()<CR>"zc%( <C-R>z)<ESC>%mz=%`za
nnoremap <LEADER>i0 :call FindBracket()<CR>"zc%(<C-R>z )<ESC>mz=%`zi
nnoremap <LEADER>i[ :call FindBracket()<CR>"zc%[ <C-R>z]<ESC>%mz=%`za
nnoremap <LEADER>i] :call FindBracket()<CR>"zc%[<C-R>z ]<ESC>mz=%`zi
nnoremap <LEADER>i{ :call FindBracket()<CR>"zc%{ <C-R>z}<ESC>%mz=%`za
nnoremap <LEADER>i} :call FindBracket()<CR>"zc%{<C-R>z }<ESC>mz=%`zi

nnoremap <LEADER>w( "zciw( <C-R>z)<ESC>%a
nnoremap <LEADER>w) "zciw(<C-R>z )<ESC>i
nnoremap <LEADER>w9 "zciw( <C-R>z)<ESC>%a
nnoremap <LEADER>w0 "zciw(<C-R>z )<ESC>i
nnoremap <LEADER>w[ "zciw[ <C-R>z]<ESC>%a
nnoremap <LEADER>w] "zciw[<C-R>z ]<ESC>i
nnoremap <LEADER>w{ "zciw{ <C-R>z}<ESC>%a
nnoremap <LEADER>w} "zciw{<C-R>z }<ESC>i

vnoremap <LEADER>w( "zc( <C-R>z)<ESC>%a
vnoremap <LEADER>w) "zc(<C-R>z )<ESC>i
vnoremap <LEADER>i9 "zc( <C-R>z)<ESC>%a
vnoremap <LEADER>i0 "zc(<C-R>z )<ESC>i
vnoremap <LEADER>w[ "zc[ <C-R>z]<ESC>%a
vnoremap <LEADER>w] "zc[<C-R>z ]<ESC>i
vnoremap <LEADER>w{ "zc{ <C-R>z}<ESC>%a
vnoremap <LEADER>w} "zc{<C-R>z }<ESC>i

nnoremap <LEADER>r( ma%r)``r(
nnoremap <LEADER>r[ ma%r]``r[
nnoremap <LEADER>r{ ma%r}``r{

"inoremap <C-9> <ESC>F("zd%i( <C-R>z)<ESC>%a


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

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
    " Do Linux-specific stuff.
    inoremap <M-(> (
    inoremap <M-)> (<esc><right>%a)<esc>%a
    inoremap <M-[> [
    inoremap <M-]> [<esc><right>%a]<esc>%a
    inoremap <M-{>{ {
    inoremap <M-}>} {<esc><right>%a}<esc>%a
else
    " MacVim Mappings
    inoremap <D-(> (
    inoremap <D-)> (<esc><right>%a)<esc>%a
    inoremap <D-[> [
    inoremap <D-]> [<esc><right>%a]<esc>%a
    inoremap <D-[><D-[> {
    inoremap <D-]><D-]> {<esc><right>%a}<esc>%a
endif

vnoremap <leader>" "zc"<C-R>z"
vnoremap <leader>' "zc'<C-R>z'
vnoremap <leader>( "zc(<C-R>z)
vnoremap <leader>[ "zc[<C-R>z]
vnoremap <leader>{ "zc{<C-R>z}

inoremap <expr> <bs> <SID>delpair()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

"inoremap <expr> " <SID>pairquotes('"')
"inoremap <expr> '' <SID>pairquotes("'")

function! s:delpair()
	let l:lst = ['""',"''",'{}','[]','()']
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-2 : l:col-1]
	if index(l:lst, l:chr) > -1
		return "\<bs>\<del>"
	else
		let l:chr = l:line[l:col-3:l:col-2]
		if (index(l:lst, l:chr)) > - 1
			return "\<bs>\<bs>"
		endif
		return "\<bs>"
endfunction

function! s:escapepair(right)
	let l:col = col('.')
	let l:chr = getline('.')[l:col-1]
	if a:right == l:chr 
		return "\<right>"
	else
		return a:right
endfunction

function! s:pairquotes(pair)
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-1]
	if a:pair == l:chr 
		return "\<right>"
	else
		return a:pair.a:pair."\<left>"
endfunction

