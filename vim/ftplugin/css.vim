" autocomplete
"setlocal omnifunc=csscomplete#CompleteCSS

" automatically indent, including after any {
setlocal smartindent
setlocal smartindent cinwords={

" clear trailing whitespace on save
autocmd BufWritePre <buffer> :%s/[ \t\r]\+$//e
