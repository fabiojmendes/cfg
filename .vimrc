" General
syntax enable
set background=dark
set nocompatible
set hidden
set mouse=a
set scrolloff=8

set modeline
set number
set laststatus=2
set noshowmode

" Theme
set termguicolors
colorscheme onedark

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Identation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=4
set autoindent
set smartindent

"""""""""""""""
" KeyBindings "
"""""""""""""""

map <space> <Leader>
nmap <leader>bd <cmd>bd<cr>

" Move between buffers
nnoremap <S-H> <cmd>bprev<cr>
nnoremap <S-L> <cmd>bnext<cr>
" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Esc redraws the screen and removes any search highlighting
nnoremap <silent> <esc> <cmd>nohl<cr><esc>
" Maps <C-c> to <esc> so it triggers abbreviations
inoremap <C-c> <esc>

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

noremap <c-s> <cmd>w<cr><esc>
inoremap <c-s> <cmd>w<cr><esc>
vnoremap <c-s> <cmd>w<cr><esc>

" Better cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout
set ttimeoutlen=1
set ttyfast

" Commentary
setlocal commentstring=#\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType systemd setlocal commentstring=#\ %s
