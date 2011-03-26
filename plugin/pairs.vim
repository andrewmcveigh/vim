" Vim script
" Last Change: Sept 15, 2010
" Author: Andrew Mcveigh
" URL: http://andrewmcveigh.com
" License: ---
" Version: 0.1
" Uses closepairs.vim as a starting point

if !exists('g:load_pairs')
  let g:load_pairs = 1
endif

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

nnoremap <LEADER>90 ma%v?[\]\}\)]<CR>lx``v/[\[\{\(]<CR>hx
nnoremap <LEADER>() ma%x``x
nnoremap <LEADER>9b l?[\[\{\(]<CR>ma%a)<ESC>``i(<SPACE><ESC>i
nnoremap <LEADER>[b l?[\[\{\(]<CR>ma%a]<ESC>``i[<ESC>a
nnoremap <LEADER>{b l?[\[\{\(]<CR>ma%a}<ESC>``i{<ESC>a
nnoremap <LEADER>9i lbi( <ESC>ea <ESC>i)<ESC>lxh%a
nnoremap <LEADER>9a lbi(<ESC>ea <ESC>i )<ESC>lxhha
vnoremap <LEADER>9i "zc( <C-R>z <ESC>i)<ESC>lxh%a
vnoremap <LEADER>9I "zc(<C-R>z <ESC>i)<ESC>lxh%i
vnoremap <LEADER>9a "zc(<C-R>z  <ESC>i)<ESC>lxhha
nnoremap <LEADER>r( ma%r)``r(
nnoremap <LEADER>r[ ma%r]``r[
nnoremap <LEADER>r{ ma%r}``r{

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

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
    " Do Linux-specific stuff.
    inoremap <C-(> (
    inoremap <C-)> (<esc><right>%a)<esc>%a
    inoremap <C-]>[ [
    inoremap <C-]>] [<esc><right>%a]<esc>%a
    inoremap <C-]>{ {
    inoremap <C-]>} {<esc><right>%a}<esc>%a
else
    " Mac Mappings
    inoremap <D-(> (
    inoremap <D-)> (<esc><right>%a)<esc>%a
    inoremap <D-[> [
    inoremap <D-]> [<esc><right>%a]<esc>%a
    inoremap <D-[><D-[> {
    inoremap <D-]><D-]> {<esc><right>%a}<esc>%a
endif

vnoremap <leader>" "zdi"<C-R>z"
vnoremap <leader>' "zdi'<C-R>z'
vnoremap <leader>( "zdi(<C-R>z)
vnoremap <leader>[ "zdi[<C-R>z]
vnoremap <leader>{ "zdi{<C-R>z}

inoremap <expr> <bs> <SID>delpair()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

inoremap <expr> " <SID>pairquotes('"')
"inoremap <expr> '' <SID>pairquotes("'")

nnoremap <LEADER>9b l?[\[\{\(]<CR>ma%a)<ESC>``i(<SPACE><ESC>i
function! s:CommentOut()
  if g:ft_check == "clojure"
    return " ?[\[\{\(]\<CR>ma%a)\<ESC>``i(comment \<ESC>"
  endif
endfunction
nnoremap <expr> <LEADER>// <SID>CommentOut()


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

" vim: ts=2 sw=2 softtabstop=2 et 
