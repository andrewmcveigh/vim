" Python indent file
" Language:	    Python
" Maintainer:	    Eric Mc Sween <em@tomcom.de>
" Original Author:  David Bustos <bustos@caltech.edu> 
" Last Change:      2004 Jun 07

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal nolisp
setlocal autoindent
setlocal indentexpr=GetMplIndent(v:lnum)
setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except

let s:maxoff = 50

" Find the block starter that matches the current line
function! s:BlockStarter(lnum, block_start_re)
    let lnum = a:lnum
    let maxindent = 10000       " whatever
    while lnum > 1
        let lnum = prevnonblank(lnum - 1)
        if indent(lnum) < maxindent
            if getline(lnum) =~ a:block_start_re
                return lnum
            else 
                let maxindent = indent(lnum)
                " It's not worth going further if we reached the top level
                if maxindent == 0
                    return -1
                endif
            endif
        endif
    endwhile
    return -1
endfunction

function! s:BlockStarter2(lnum, block_start_re)
    let lnum = a:lnum
    let maxindent = 10000       " whatever
    while lnum > 1
        let lnum = prevnonblank(lnum - 1)
        if indent(lnum) < maxindent
            if getline(lnum) =~ a:block_start_re
                return lnum
            else 
                let maxindent = indent(lnum)
                " It's not worth going further if we reached the top level
                ""if maxindent == 0
                ""    return -1
                ""endif
            endif
        endif
    endwhile
    return -1
endfunction

function! GetMplIndent(lnum)
    
    " First line has indent 0
    if a:lnum == 1
        return 0
    endif

    " Examine this line
    let thisline = getline(a:lnum)
    let thisindent = indent(a:lnum)

    let block_start_regex = '^\s*<\(frontpage\|paper\|header\|footer\|canvas\|conditional\|repeating\|island\|stack\|span\|array\|row\)'
    let lnum = prevnonblank(a:lnum - 1)
    let prevline = getline(lnum)
    echo prevline
    if prevline =~ block_start_regex
        return indent(lnum) + &sw
    elseif thisline =~ '^\s*<end' 
        let tagname = matchlist(thisline, '^\s*<end \(.\+\)>.*$')[1]
        let bslnum = s:BlockStarter2(a:lnum, '^\s*<'.tagname)
        echo bslnum
        if bslnum > 0
            return indent(bslnum)
        else
            return -1
        endif
    elseif thisline =~ '^\s*}'
        return indent(lnum) - &sw
    elseif prevline =~ '^\s*{'
        return indent(lnum) + &sw
    else
        return indent(lnum)
    endif

endfunction
" [-- EOF <runtime>/indent/html.vim --]
