
syn match clojureTestFail /\(\(\[F\]\|\[FAILED\]\):\|(REPL:\d\+)\)/ contained
syn match clojureTestPass /\[PASSED\]:/ contained

syn match   clojureComment contains=clojureTodo,clojureTestFail,clojureTestPass ";.*$"

syn region clojureFailComment start=";;; [F]:" end="\n"

highlight link clojureTestFail Error
highlight link clojureTestPass Boolean

highlight! clojureParen  guifg=#204b56 guibg=#002b36 gui=Bold
