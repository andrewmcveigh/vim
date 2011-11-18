"Slimv command to open repl - not quite working, but keeping for reference
"let g:slimv_lisp = '"\"cd ' .getcwd(). '\" \"java -classpath $(echo ' . getcwd() . '/lib/*.jar ' . getcwd() . '/lib/dev/*.jar ' . getcwd() . '/src | sed -e s/\ /:/g) clojure.main\""'

" Plugin settings {{{

let g:paredit_mode=1

" }}}
