" treat tabs as spaces
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal expandtab

" intelligent indenting
setlocal autoindent
setlocal smartindent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" enable autocompletion
"setlocal omnifunc=pythoncomplete#Complete

" clear trailing whitespace on save
autocmd BufWritePre <buffer> :%s/[ \t\r]\+$//e

" execute the current script on demand
"nmap <buffer> <F5> :w<Esc>mwG:r!python %<CR>`.
"noremap <C-M> :w!<CR>:!python %<CR>
"noremap <F5> :w!<CR>:!python %<CR>
