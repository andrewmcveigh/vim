function! Refresh_sass()
    if &modified
        write
        exec "!compass compile"
        call Refresh_firefox()
    endif
endfunction
autocmd BufWriteCmd *.sass :call Refresh_sass()
