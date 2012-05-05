" plugin/peepopen.vim
" Author:   Geoffrey Grosenbach <boss@topfunky.com>
" License:  MIT License

" Install this file as plugin/peepopen.vim.

" If you prefer Command-T, use this snippet in your .gvimrc:

" if has("gui_macvim")
"   macmenu &File.New\ Tab key=<nop>
"   map <D-t> <Plug>PeepOpen
" end

" ============================================================================

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if &cp || exists("g:peepopen_loaded") && g:peepopen_loaded
  finish
endif
let g:peepopen_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

function s:LaunchPeepOpenViaVim()
  let cwd = getcwd()
  silent exe "!open \"peepopen://" . shellescape(cwd) . "?editor=MacVim\""
endfunction

command! PeepOpen :call <SID>LaunchPeepOpenViaVim()

noremap <unique> <script> <Plug>PeepOpen <SID>Launch
noremap <SID>Launch :call <SID>LaunchPeepOpenViaVim()<CR>

"if !hasmapto('<Plug>PeepOpen')
if !hasmapto(':PeepOpen')
  "map <unique> <silent> <Leader>p <Plug>PeepOpen
  noremap <unique> <silent> <Leader>h :PeepOpen<CR>
  noremap <unique> <silent> <Leader>t :vs<CR>:PeepOpen<CR>
  noremap <unique> <silent> <Leader>n :sp<CR>:PeepOpen<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set sw=2 sts=2:
