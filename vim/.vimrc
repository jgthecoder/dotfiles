set nocompatible
filetype plugin indent on
filetype on

set number
set relativenumber

set autoindent
set smartindent
set smarttab
set expandtab      " use spaces instead of tabs
set shiftwidth=4   " spaces per indentation step
set tabstop=4      " how many spaces a <Tab> counts for
set showmatch
set backspace=indent,eol,start

set wildmenu
set colorcolumn=80
syntax on
set laststatus=2

set termguicolors
set bg=dark

colorscheme quiet
highlight Keyword cterm=bold
highlight Comment cterm=italic
highlight Constant guifg=#999999
highlight NormalFloat guibg=#333333
highlight Visual guifg=#285577 guibg=#aaaaaa
highlight Function cterm=bold
highlight Identifier cterm=bold
