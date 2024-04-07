let need_to_install_plugins = 0

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

" ----- PLUG INSTALL PACKAGES ----- "

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'fatih/vim-go'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --enable-python3-completer' }

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" ----- PLUG INSTALL PACKAGES ----- "

" ----- VIM-AIRLINE ----- "
let g:airline_theme = 'murmur'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" ----- FZF ----- "
let g:fzf_action = {
\ 'enter': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }

" ----- COLORSCHEME ----- "
set background=dark
colorscheme molokai
set t_Co=256

" ----- GIT GUTTER ----- "
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
set updatetime=250
let g:gitgutter_max_signs = 500
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

