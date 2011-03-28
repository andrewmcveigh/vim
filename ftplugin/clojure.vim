"let g:slimv_lisp = '"\"cd ' .getcwd(). '\" \"java -classpath $(echo ' . getcwd() . '/lib/*.jar ' . getcwd() . '/lib/dev/*.jar ' . getcwd() . '/src | sed -e s/\ /:/g) clojure.main\""'
