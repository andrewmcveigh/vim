function! Pad(s,amt)
    return a:s . repeat(' ',a:amt - len(a:s))
endfunction

function! PrePad(s,amt,prefix,...)
    if a:0 > 0
        let char = a:1
    else
        let char = ' '
    endif
    return repeat(char,a:amt - len(a:s)) . a:prefix . a:s
endfunction

function! GetIssues()
    let username="me@andrewmcveigh.com"
    let password="g&dC5p@JeQ97s3dR"
    let url='https://api.bitbucket.org/1.0/repositories/andrewmcveigh/com.budgetplannr/issues?status=new\&status=open\&kind=bug\&kind=enhancement\&kind=proposal\&kind=task\&limit=50'
    let raw=system("curl -s -u ".username.":\"".password."\" ".url)
    if raw != ''
        vnew
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal buflisted
        let json=ParseJSON(raw)["issues"]
        call map(json, 'PrePad(v:val["local_id"],3,"#").": ".v:val["status"]." ".v:val["title"]')
        call append(0, json)
    endif
endfunction

function! UpdateIssues()
    
endfunction
