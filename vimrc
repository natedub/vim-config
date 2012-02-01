" Pretty colors {{{
set t_Co=256
"colorscheme wombat256
set background=dark
let g:solarized_termcolors=16
colorscheme solarized
" }}}

" syntax highlighting!
syntax on

" default text encoding (needed for the tab/trail chars)
set encoding=utf-8

" tab/trail chars
set list listchars=tab:»\ ,trail:·

" enable line wrapping when using backspace/delete
set backspace=indent,eol,start

" set the terminal title to display the open file name etc
set title

" always show the cursor position
set ruler

" enable xterm mouse support
set mouse=a

" show line numbers relative to the line you're on for easy jumps
set relativenumber

" show a wicked status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{fugitive#statusline()}\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2

" highlight the line under the cursor
set cursorline

" make searching case-insensitive unless you use a capital
set ignorecase
set smartcase

" incremental search
set incsearch

" keep 50 lines of command history (default is 20)
set history=200

" menu has tab completion
set wildmenu
set wildmode=longest:full
"set wildmode=full

" create a full shell that executes the bashrc
"set shell=bash\ --login

let g:SuperTabDefaultCompletionType = "<c-n>"

" tab widths
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
set smarttab

" enable auto-indentation
set autoindent
set smartindent

" enable ~/.vim/ftplugin/* file-specific scripts
filetype plugin on

" remove trailing whitespace
autocmd FileType xml,html,php,phtml,css,js,rst,txt,htmljinja autocmd BufWritePre <buffer> :%s/[ \t\r]\+$//e

" set the filetype properly for .proto files so that syntax highlighting works
autocmd! BufRead,BufNewFile *.proto setfiletype proto

" enable autocomplete
autocmd FileType rst set textwidth=80
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" 1000 undos. good for gundo especially!
set undolevels=1000

" highlight all characters after 79th column as a warning msg
"autocmd BufNewFile,BufRead *.py,*.rst match warningmsg /\%>79v.\+/
autocmd BufNewFile,BufRead *.jinja2,*.jinja2js set filetype=htmljinja

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Define a leader key. This is the default.
let mapleader = "\\"
"let maplocalleader 

" Open and source my .vimrc file by hitting \ev or \sv
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Easy tab naviagation
nnoremap tn :tabnext<cr>
nnoremap tp :tabprev<cr>
nnoremap td :tabnew %:p:h<cr>

" Open the directory listing for the current file in the current tab
nnoremap tc :e %:p:h<cr>

" Disable arrow keys
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>
"
" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy window splitting
nnoremap ts :vsplit<cr>
nnoremap th :split<cr>

" Disable the damn manual key
nnoremap K <nop>

" Strip docstrings and linebreaks from a sqlalchemy Table definition
vnoremap <leader>sd :s/, doc=\_.\{-}""")/)/g<cr>gv!grep .<cr>

" Sort a block of imports (or any block. blocks are separated by blank lines)
nnoremap <leader>si vip:!sort\|uniq<cr>

" Split the comma separated import on the current line into two separate
" imports, then sort. Returns to the same line after, so can be repeated
" when there are many imports on the same line.
nnoremap <leader>fi 0v/import<cr>eyf,pF,s<cr><esc>vip:!sort\|uniq<cr>

" Search forward or back for the selected characters by re-using * and #,
" but only when in visual mode.
" NOTE: This doesn't use a word-based regex, and I hope you didn't use the
"       p register at all.
vnoremap * "py/<c-r>p<cr>
vnoremap # "py?<c-r>p<cr>

" Automatically open the quickfix window when using :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

call pathogen#infect()

nnoremap <F5> :GundoToggle<CR>

" Navigate diffs when opened by my gitcfo shell alias {{{
"     function gitcfo() { CFO_BASE=$1 vim -c "Gdiff $1" `git show --pretty="format:" --name-only $1..$2 | grep . | uniq`; }
" (Still buggy but sometimes useful)
function! NavigateDiffs(direction)
	execute ":" . a:direction
	try
		execute ":Gdiff " . $CFO_BASE
	catch /Needed a single revision/
		execute "normal! :echo 'This file did not exist before now'\r"
	endtry
endfunction
nnoremap [f <C-W>l<C-W><C-O>:call NavigateDiffs('previous')<cr>
nnoremap ]f <C-W>l<C-W><C-O>:call NavigateDiffs('next')<cr>
" }}}

iabbrev foriin for (var i = 0, x; x = y[i]; ++i) {


" Split/Join {{{
"
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
"            becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" Especially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
"nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
" }}}
"
