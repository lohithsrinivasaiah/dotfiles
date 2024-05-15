let need_to_install_plugins = 0

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

" ------ ALE ------ "
let g:ale_completion_enabled = 1

" ----- PLUG INSTALL PACKAGES ----- "
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe'

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
colorscheme codedark
set t_Co=256

" ----- GIT GUTTER ----- "
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
set updatetime=1
let g:gitgutter_max_signs = 500
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" ------ ALE ------ "
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction
