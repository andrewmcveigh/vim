function! Cljs()
    setlocal filetype=clojure
    let vimclojure#WantNailgun=0
    let delimitMate_quotes = "\""
endfunction

function! Clj()
    setlocal filetype=clojure
    let vimclojure#WantNailgun=1
    let delimitMate_quotes = "\""
endfunction

au BufNewFile,BufRead *.cljs call Cljs()
au BufNewFile,BufRead *.clj call Clj()
au BufNewFile,BufRead *.cljx call Clj()
