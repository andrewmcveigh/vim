" Vim filetype plugin
" Language:		txt
" Maintainer:		Andrew Mcveigh

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal spell spelllang=en_gb
highlight SpellCap none
