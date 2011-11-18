nmap <LEADER>eb Vip"zy :call PythonEvalParagraph(@z)<CR>
vmap <LEADER>eb "zy :call PythonEvalParagraph(@z)<CR>
nmap <LEADER><BS><BS> vip:s/^\(#\~-> \).*\n//ge<CR>

""setlocal foldmethod=indent
""setlocal foldlevel=0

function! StartRepl()
    let current_buffer = bufnr("%")
    let g:conque_instance = conque_term#open('python')
    file python_repl
    execute "buffer ".current_buffer
endfunction

function! ReplWriteln(code)
    call g:conque_instance.writeln(a:code)
    return g:conque_instance.read(50, 1)
endfunction

function! PythonEvalParagraph(code)
    if !exists('g:conque_instance')
        call StartRepl()
    endif
    let lines = [""] + split(a:code, "[\r\n]")
    let @y = ""
    let first = 1
    for line in lines
        let @y .= ReplWriteln(line)
    endfor
    normal vip
    normal "yp
    silent '<,'>s/[]//ge
    silent '<,'>s/\[C//ge
    silent '<,'>s/\[K>>> //ge
    silent '<,'>s/^\(>>> \|\.\.\. \)\@!\(.*\)/#\~-> \2/ge
    silent '<,'>s/^\(>>> \|\.\.\. \)\(.*\)/\2/ge
    '<
    normal dd
endfunction

""function! GotoReplBuffer()
""    if bufexists('python_repl')
""        buffer python_repl
""    else
""        execute 'ConqueTerm python'
""        sleep 500m
""        file python_repl
""    endif
""    normal i
""    normal Gmz
""endfunction
""function! PythonEvalParagraph(code)
""    let lines = split(a:code, "[\r\n]") + [""]
""    let current_buffer = bufnr("%")
""    call GotoReplBuffer()
""    for line in lines
""        execute "normal i".line."\<CR>"
""    endfor
""    normal kV'z"zyG
""    ""execute "buffer ".current_buffer
""    ""normal vip
""    ""normal "zp
""    ""silent '<,'>s/^\(>>> \|\.\.\. \)\@!\(.*\)/#⚕\~-> \2/ge
""    ""silent '<,'>s/^\(>>> \|\.\.\. \)\(.*\)/\2/ge
""endfunction

""function! PythonEvalParagraph(code)
""    let lines = [""] + split(a:code, "[\r\n]") + [""]
""    let current_buffer = bufnr("%")
""    ""normal vipd
""    ""set paste
""    for line in lines
""        let @y .= ReplWriteln(line)
""    endfor
""    ""execute "normal i".substitute(response, "\n", "", "g")
""    ""set nopaste
""    ""execute "buffer ".current_buffer
""    normal vip
""    normal "yp
""    ""silent '<,'>s/^\(>>> \|\.\.\. \)\@!\(.*\)/#⚕\~-> \2/ge
""    ""silent '<,'>s/^\(>>> \|\.\.\. \)\(.*\)/\2/ge
""endfunction

