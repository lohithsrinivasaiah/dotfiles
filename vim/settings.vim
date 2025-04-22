" Modern, Useful Vim Settings
" --------------------------
" Sensible defaults, modern navigation, and improved usability.

" Disable vi compatibility.
set nocompatible

" Enable filetype detection, plugins, and indentation.
filetype on
filetype plugin on
filetype indent on

" Syntax highlighting.
syntax enable

" Show line numbers and relative numbers for easy navigation.
set number
set relativenumber

" Enable mouse support in all modes (if available).
set mouse=a

" Use system clipboard if available (for easy copy/paste).
set clipboard=unnamedplus

" Highlight current line for better focus.
set cursorline

" Show matching parentheses/brackets.
set showmatch

" Better splits: open new splits below/right.
set splitbelow
set splitright

" Enable persistent undo (undo history survives restarts).
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
  endif
endif

" Faster redraw and plugin responsiveness.
set lazyredraw
set updatetime=300

" Set history size.
set history=1000

" Smart search settings.
set incsearch
set ignorecase
set smartcase
set hlsearch
set showcmd
set showmode

" Sensible tab settings (default 4, language-specific below).
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

" Language-specific indentation.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab

" Don't create swap or backup files.
set noswapfile
set nobackup

" Scrolling and wrapping.
set scrolloff=10
set nowrap

" Backspace works as expected in insert mode.
set backspace=indent,eol,start

" ----- FZF ----- "
" Open files in new tab on <CR> in FZF
let g:fzf_action = {
  \ 'enter': 'tabedit',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
\ }

" FZF: Restore default behavior for Esc (no custom Esc mapping)
" (No let g:fzf_layout set here)

" Optional: Show invisible characters (uncomment if desired)
" set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:+

" Optional: Highlight column 80 (uncomment if desired)
" set colorcolumn=80

" More settings can be added below as needed.
