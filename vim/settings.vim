" Basic Setup
syntax on
let python_highlight_all = 1
filetype indent on
set laststatus=2
set scrolloff=8
set cursorline

" FileType indent
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab

" Visual Settings
set visualbell
set noerrorbells

" Files
set noswapfile

" Search
set incsearch
set modifiable
set showcmd
