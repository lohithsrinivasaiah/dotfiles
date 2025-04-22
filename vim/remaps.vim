" Modern, Useful Vim Key Remaps
" -----------------------------
" Focused on productivity, navigation, and plugin integration

" ----- LEADER KEY -----
let mapleader = " "

" ----- GENERAL REMAPS -----
" Toggle line numbering
nnoremap <leader>tn :call ToggleNumbering()<CR>
" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>
" Toggle paste mode
nnoremap <leader>sp :set paste!<CR>
" Center cursor after half-page scroll
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Center cursor after search
nnoremap n nzz
nnoremap N Nzz

" ----- WINDOW & TAB MANAGEMENT -----
" Easy tab navigation
nnoremap <C-t> :tabe<CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
" Split windows
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
" Move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ----- TERMINAL EMULATION (Vim 8+) -----
nnoremap <silent> <leader>sv :vertical botright terminal<CR>
nnoremap <silent> <leader>sh :belowright terminal<CR>

" ----- INDENT/UNINDENT WITH TAB/S-TAB -----
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" ----- SYSTEM CLIPBOARD -----
vnoremap <Leader>y "+y<Esc>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" ----- FZF & FILE NAVIGATION -----
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" ----- GIT GUTTER -----
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>gn :GitGutterNextHunk<cr>
nnoremap <leader>gp :GitGutterPrevHunk<cr>

" ----- COC.NVIM (if enabled) -----
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" ----- CUSTOM FUNCTIONS -----
function! ToggleNumbering()
    if &relativenumber == 1
        set norelativenumber
        set nonumber
    else
        set relativenumber
        set number
    endif
endfunction

" ----- QUICK SAVE & QUIT -----
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" ----- BETTER ESCAPE FROM TERMINAL MODE -----
if has('nvim') || exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

" ----- OPTIONAL: Disable Ex mode (rarely used, easy to hit by accident) -----
nnoremap Q <Nop>

" Add more remaps below as needed
