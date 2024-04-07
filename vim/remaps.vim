" ----- LEADER KEY ----- "
let mapleader = " "

" ----- REMAPS ----- "
nnoremap <leader>n :call ToggleNumbering()<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>p :set paste!<CR>
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
nnoremap <C-t> :tabe <CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>

" ----- CUSTOM FUNCTIONS ----- "
function! ToggleNumbering()
    if &relativenumber == 1
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

" ----- GIT GUTTER ------ "
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>gn :GitGutterNextHunk<cr>
nnoremap <leader>gp :GitGutterPrevHunk<cr>

" ----- FZF ----- "
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
