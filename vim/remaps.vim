" Remaps
map <leader>n :call ToggleNumbering()<CR>
map <leader>h :noh<CR>
map <leader>p :set paste!<CR>
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

" Terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" Indent/unindent with tab/s-tab
set ts=4 sts=4 sw=4 expandtab
set smartindent
nmap <Tab> >>
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" Centers search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Panes
nmap <C-t> :tabe
nmap <C-h> gT
nmap <C-l> gt

" ***** Custom Functions *****
function! ToggleNumbering()
    set norelativenumber!
    set nonumber!
endfunction
