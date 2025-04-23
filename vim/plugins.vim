" Auto-install vim-plug if missing, then reload config
if empty(glob('~/.vim/autoload/plug.vim'))
  silent! execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * source $MYVIMRC
  finish
endif

" If you see network/curl errors above, download plug.vim manually:
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" and place it in ~/.vim/autoload/plug.vim

let need_to_install_plugins = 0

if empty(glob('~/.vim/autoload/plug.vim'))
    silent! execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    let need_to_install_plugins = 1
endif

if need_to_install_plugins
    echo "vim-plug has been installed. Please run :PlugInstall to install your plugins."
endif

" ------ PLUGINS ------
call plug#begin('~/.vim/plugged')

" UI & Statusline
Plug 'vim-airline/vim-airline'           " Status/tabline (keep, or use lightline)
Plug 'vim-airline/vim-airline-themes'    " Airline themes

" Git integration
Plug 'airblade/vim-gitgutter'            " Git diff in sign column

" File explorer
Plug 'preservim/nerdtree'                " File tree (or try fern.vim)

" Autocomplete (modern alternative: coc.nvim)
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Async intellisense engine

" Delimiter completion
Plug 'Raimondi/delimitMate'

" Indentation guides (or try Yggdroot/indentLine)
Plug 'preservim/vim-indent-guides'

" Theme
Plug 'tomasr/molokai'

" Fuzzy finder
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

" ------ PLUGIN CONFIGS ------

" Airline configuration
let g:airline_theme = 'murmur'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_right_sep = ''
let g:airline_left_sep = ''

" NERDTree (optional: auto open)
" autocmd vimenter * NERDTree

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

" FZF (optional: set default command)
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!{.git,node_modules}/*"'

" coc.nvim (minimal config, see :h coc-config)
" let g:coc_global_extensions = ['coc-json', 'coc-tsserver']

" Theme
syntax enable
colorscheme molokai

" General: sensible defaults (optional)
" Plug 'tpope/vim-sensible'

" Add more plugin configs below as needed

" See install.sh for auto-install instructions
