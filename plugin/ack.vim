" NOTE: You must, of course, install the ack script
"       in your path.
" On Ubuntu:
"   sudo apt-get install ack-grep
"   ln -s /usr/bin/ack-grep /usr/bin/ack
" With MacPorts:
"   sudo port install p5-app-ack

let g:ackprg="ack\\ --nocolor"

function! Ack(command, format, args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    let grepformat_bak=&grepformat
    exec "set grepformat=" . a:format
    execute "silent! " . a:command . " " . a:args
    botright copen
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
    exec "redraw!"
endfunction

command! -nargs=* -complete=file Ack     call Ack("grep! --nogroup",    "%f:%l:%m", <q-args>)
command! -nargs=* -complete=file AckAdd  call Ack("grepadd! --nogroup", "%f:%l:%m", <q-args>)
command! -nargs=* -complete=file LAck    call Ack("lgrep! --nogroup",   "%f:%l:%m", <q-args>)
command! -nargs=* -complete=file LAckAdd call Ack("lgrepadd! --nogroup","%f:%l:%m", <q-args>)

command! -nargs=* -complete=file AckG    call Ack("grep! -g", "%f", <q-args>)
command! -nargs=* -complete=file AckGAll call Ack("grep! -g", "%f", <q-args>)
