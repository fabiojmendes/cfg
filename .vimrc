" General
syntax enable
set background=dark
set nocompatible
set hidden
set mouse=a
set ttymouse=sgr
set scrolloff=8

set modeline
set number
set laststatus=2
set noshowmode
set nowrap

set wildmode=list:longest,full
set wildoptions=pum
set completeopt=longest,menu,noselect

" Theme
packadd! onedark.vim
set termguicolors
colorscheme onedark

" Splits
set splitright
set splitbelow

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

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

" Leader
let mapleader = " "
nmap <leader>bd <cmd>bd<cr>
" FZF
nmap <leader><space> <cmd>Files<cr>
nmap <leader>ff <cmd>Files<cr>
nmap <leader>fg <cmd>GFiles<cr>
nmap <leader>fb <cmd>Buffers<cr>
nmap <leader>fr <cmd>History<cr>
nmap <leader>sj <cmd>Jumps<cr>
nmap <leader>sm <cmd>Marks<cr>
" Fugitive
nmap <leader>gg <cmd>Git<cr>
nmap <leader>gd <cmd>Gvdiffsplit!<cr>

" Move between buffers
nnoremap <S-H> <cmd>bprev<cr>
nnoremap <S-L> <cmd>bnext<cr>
" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Esc removes search highlighting
if v:version >= 900
  noremap <silent> <esc> <cmd>nohl<cr><esc>
endif

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

" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"

set ttimeout
set ttimeoutlen=1
set ttyfast

" Default Comment String
setlocal commentstring=#\ %s
autocmd FileType aptconf setlocal commentstring=//\ %s

" Quit help using 'q'
autocmd FileType help noremap <buffer> q <cmd>q<cr>

if has('mac')
  set rtp+=/opt/homebrew/opt/fzf
elseif has('linux')
  let s:uname = system('uname -a')
  if match(s:uname, 'Debian\|Ubuntu') != -1
    set rtp+=/usr/share/doc/fzf/examples
  endif
endif
