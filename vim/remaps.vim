" ----- LEADER KEY ----- "
let mapleader = " "

" ----- REMAPS ----- "
nnoremap <leader>tn :call ToggleNumbering()<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>sp :set paste!<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" ----- TERMINAL EMULATION ----- "
nnoremap <silent> <leader>sv :vertical botright terminal<CR>
nnoremap <silent> <leader>sh :belowright terminal<CR>

" ----- INDENT/UNINDENT WITH TAB/S-TAB ----- "
set ts=4 sts=4 sw=4 expandtab
set smartindent
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-o><<i
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" ----- CENTERS SEARCH RESULTS ----- "
nnoremap n nzz
nnoremap N Nzz

" ----- PANES ----- "
nnoremap <C-t> :tabe<CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>

" ------ COPY/PASTE TO/FROM CLIPBOARD ------
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" ----- CUSTOM FUNCTIONS ----- "
function! ToggleNumbering()
    if &relativenumber == 1
        set norelativenumber
        set nonumber
    else
        set relativenumber
        set number
    endif
endfunction

" ----- GIT GUTTER ------ "
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>gn :GitGutterNextHunk<cr>
nnoremap <leader>gp :GitGutterPrevHunk<cr>

" ----- FZF ----- "
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>

" ----- NerdTree ----- "
nnoremap <leader>nt :NERDTreeToggle<CR>


" ----- YOU COMPLETE ME ----- "
nnoremap gd :YcmCompleter GoToDefinition<CR>
nnoremap gy :YcmCompleter GetType<CR>
nnoremap gD :YcmCompleter GoToDeclaration new-tab<CR>
noremap <C-Space> :YcmCompleter GoTo<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <Leader>e :YcmToggleErrors<CR>
nnoremap <Leader>f :YcmCompleter GoToFile<CR>
nnoremap <Leader>s :YcmCompleter GoToSymbol<CR>
