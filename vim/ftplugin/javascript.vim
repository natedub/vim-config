" treat tabs as spaces
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal smarttab
setlocal expandtab

" intelligent indenting
setlocal autoindent
setlocal smartindent

" clear trailing whitespace on save
autocmd BufWritePre <buffer> :%s/[ \t\r]\+$//e
