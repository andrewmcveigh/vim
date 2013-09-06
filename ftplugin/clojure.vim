
" VimClojure Settings {{{

"let vimclojure#WantNailgun = 1
"let vimclojure#UseErrorBuffer = 1
"let vimclojure#NailgunClient = $HOME . "/Dropbox/Config/dotfiles/vim/vimclojure-nailgun-client/ng"
"let vimclojure#HighlightBuiltins = 1
"let vimclojure#ParenRainbow = 1
"let vimclojure#DynamicHighlighting = 1
"let vimclojure#SplitPos = "right"
"let vimclojure#SplitSize = 80

"let g:clojure_align_multiline_strings = 1

function! Refresh_hiccup()
    if &modified
        write
        call Refresh_firefox()
    endif
endfunction
autocmd BufWriteCmd *.hiccup :call Refresh_hiccup()

"function! s:NailGunStart()
    "echo system("ng &")
"endfunction
"command! NailGunStart call <SID>NailGunStart()

"function! s:NailGunStop()
    "let os = substitute(system('uname'), "\n", "", "")
    "if os == "Linux"
        "echo system("~/.vim/vimclojure-nailgun-client/ubuntu10.10/ng ng-stop")
    "elseif os == "Darwin"
        "echo system("~/.vim/vimclojure-nailgun-client/ng ng-stop")
    "endif
"endfunction
"command! NailGunStop call <SID>NailGunStop()

"function! ClojureCommentSelection()
    "substitute/\(^;\(.*$\)\)\|\(^.*$\)/\=len(submatch(2))>0?submatch(2):";".submatch(3)/g
    "nohl
"endfunction

" toggle clojure line comments
"vnoremap <LEADER>// :call ClojureCommentSelection()<CR>
"nnoremap <LEADER>// V:call ClojureCommentSelection()<CR>
"nnoremap <LEADER>/p vip:call ClojureCommentSelection()<CR>
"inoremap <F5> :CakeReload<CR>
"nnoremap <F5> :CakeReload<CR>
"vnoremap <F5> :CakeReload<CR>

"setlocal iskeyword-=.

function! NewFile(v)
    if &filetype == 'clojure'
        let current  = getcwd()
        let splitdir = split(@%, 'src')
        if len(splitdir) > 1
            let workdir  = substitute(splitdir[0], current.'/', '', 'g')
            let cur_ns   = join(split(split(splitdir[1], '\.')[0], '/'), '.')
            set iskeyword-=.
            let ns = input('Enter Namespace: ', cur_ns)
            if ns != ''
                set iskeyword+=.
                let ns_split = split(ns, '\.')
                let path = workdir . 'src/' . join(ns_split[0:-2], '/')
                let filename = workdir . 'src/' . join(ns_split, '/') . '.clj'
                if !filereadable(filename)
                    if !isdirectory(path)
                        let createdir = input('Directory ['.path.'] does not exist. Create? [Yn]: ')
                        if createdir == 'Y' || createdir == 'y' || createdir == ''
                            execute "!mkdir -p ".path
                        else
                            return
                        endif
                    endif
                else
                    echo 'File Exists!'
                    return
                endif
                if a:v
                    silent! execute 'vsplit '.filename
                else
                    silent! execute 'split '.filename
                endif
                call append(0, "(ns ".substitute(ns, '_', '-', 'g').")")
            endif
        else
            echo 'Invalid Namespace!'
            return
        endif
    else
        new
    endif
endfunction

command! New :call NewFile(0)<CR>
command! Vnew :call NewFile(1)<CR>

function! s:ReplFileCmd(file, cmd)
    let content = readfile(a:file) 
    return vimclojure#ExecuteNailWithInput("Repl", join(content + a:cmd, "\n"), "-r")
endfunction

function! s:RunJetty(service, ...)
    let svr = []
    if a:0 > 0
        let svr = ["(defonce server (org.eclipse.jetty.server.Server. ".a:1."))"]
    else
        let svr = ["(defonce server (org.eclipse.jetty.server.Server. 8080))"]
    endif

    let svr += readfile($HOME."/.vim/run_jetty.clj")
    
    echo <SID>ReplFileCmd(findfile("servlet.clj", getcwd() . "/src**"), svr)
endfunction

command! -nargs=? RunJetty call <SID>RunJetty('app', <f-args>)

function! s:StopJetty(service, port)
    echo <SID>ReplFileCmd(findfile("servlet.clj", getcwd() . "/src**"), ['(.stop server)'])
endfunction
command! StopJetty call <SID>StopJetty('app', 8080)

function! s:FailComp(a, b)
    return a:b.line - a:a.line
endfunction

function! s:RunTests()
    write
    "let res = ""
    if match(expand("%:r"), "test$") > -1
        let res = <SID>ReplFileCmd(expand("%"), ['(run-tests)'])
    else
        let res = <SID>ReplFileCmd(substitute(expand("%:r"), "src/main", "src/test", "")."_test.clj", ['(run-tests)'])
    endif
    let sp = split(res.stdout, "\n")
    let test_res = sp[len(sp) - 1]
    let cmd = "(let [result ".test_res."] (and (zero? (:fail result)) (zero? (:error result))))"
    let passed = vimclojure#ExecuteNailWithInput("Repl", cmd, "-r").stdout == "true\n"
    let err = 0
    if passed
        "exec "colorscheme ".g:colors_name
        "call InsertStatuslineColor('p')
        "hi LineNr guibg=#115511
        call append(line("$"), ["", ";;; [PASSED]: ".strftime("%c")])
        normal G
    else
        let i = 0
        let fail_list = []
        for l in sp
            if match(l, 'Exception') > 0
                let err = 1
            endif
            let m = matchlist(l, 'FAIL in (\([^)]\+\)) (REPL:\(\d\+\))')
            if len(m) > 0
                let fail = {'line': m[2], 'text': []}
                for ln in sp[i : i + 2]
                    let fail.text += [";;; [F]: ".ln]
                endfor
                let fail_list += [fail]
            endif
            let i += 1
        endfor
        for fail in sort(fail_list, "<SID>FailComp")
            call append(fail.line - 1, fail.text)
        endfor
        call append(line("$"), ["", ";;; [FAILED]: ".strftime("%c")])
        "call InsertStatuslineColor('f')
        "hi LineNr guibg=#442222
    endif
    if len(res.stderr > 0) && match(res.stderr, '\w\+') > -1
        echo res.stderr
    endif
    if err > 0
        "call vimclojure#ReportError(res.stderr)
        echo res
    endif
endfunction
command! RunTests call <SID>RunTests()
noremap <F6> :RunTests<CR>
nnoremap <LEADER>ht :RunTests<CR>
nnoremap <LEADER>ct :g/\v;;; \[(PASSED\|F\|FAILED)\]: /d<CR>:nohl<CR>

nnoremap ,* viwc*<C-R>"*<ESC>
vnoremap ,* c*<C-R>"*<ESC>

nnoremap <LEADER>ef :%Eval<CR>

" }}}
