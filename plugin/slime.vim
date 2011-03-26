
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Send_to_Screen(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end

    let lines = split(substitute(a:text, "'", "'\\\\''", 'g'), "[\r\n]")
    for line in lines
      echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X stuff '" . line . "\r'")
    endfor
endfunction

function! Send_to_Screen_Paste(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end
  silent echo writefile(split(a:text, "[\r\n]"), "/tmp/screenpaste")
  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X readbuf /tmp/screenpaste")
  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X paste .")
endfunction

function! Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function! Screen_Vars()
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    let g:screen_sessionname = ""
    let g:screen_windowname = "0"
  end

  let g:screen_sessionname = input("session name: ", "", "custom,Screen_Session_Names")
  let g:screen_windowname = input("window name: ", g:screen_windowname)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""Multiple REPLs""""""""""""""""""""""""

function! Send_to_Named_Screen(text, screen)
    let lines = split(substitute(a:text, "'", "'\\\\''", 'g'), "[\r\n]")
    for line in lines
      echo system("screen -S " . a:screen . " -p " . g:screen_windowname . " -X stuff '" . line . "\r'")
    endfor
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-c><C-c> "ry :call Send_to_Screen(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>

nmap <C-c>v :call Screen_Vars()<CR>

vmap <C-c>1 "ry :call Send_to_Named_Screen(@r, "vim-1")<CR>
nmap <C-c>1 vip<C-c>1
vmap <C-g><C-g> "ry :call Send_to_Named_Screen(@r, "vim-2")<CR>
nmap <C-g><C-g> vip <C-g><C-g>
