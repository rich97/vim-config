"-- Encoding
set fileencodings=utf-8

"-- Filetype options
filetype plugin indent on

"-- Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set noexpandtab

"-- Editor behavior
set nowrap
set number

"-- Colour scheme
colorscheme Tomorrow-Night-Bright

"-- Show whitespace chars
set listchars=tab:»\ ,trail:·,extends:>,precedes:<
set list

"-- Highlight long lines (soft limit: 80, hard limit: 100)
:au BufWinEnter *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
:au BufWinEnter *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

"-- Remove trailing whitespaces from lines
autocmd FileType php autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"-- Press F5 to Clean Current Buffer 
"-- (i.e., 2-spaces become tabs, end-line whitespace trimmed)
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<CR>:%s/  /\t/eg<Bar>:let @/=_s<Bar>:nohl<CR>

"-- No eols
:autocmd BufWritePre *.php setlocal binary
:autocmd BufWritePre *.php setlocal noeol
:autocmd BufWritePost *.php setlocal nobinary

"-- Global variables
:let g:snips_author = "Richard Vanbergen"
:let g:netrw_keepdir = 0

"-- Shortcuts
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>

"-- Jump to perl module
vmap <F2> y :new \| :e `pmpath <C-r>"`<CR>
