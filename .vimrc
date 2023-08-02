" General
syntax enable
set background=dark
set nocompatible
set hidden
set mouse=a
set scrolloff=8

set modeline
set laststatus=2
set noshowmode

" Airline
let g:airline_theme='bubblegum'
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

" MatchParen colors
highlight MatchParen cterm=underline ctermfg=red ctermbg=none

" Systemd unit files
au BufNewFile,BufRead */systemd/*.{automount,mount,path,service,socket,swap,target,timer}* setf systemd

"""""""""""""""
" KeyBindings "
"""""""""""""""

map <space> <Leader>
nmap <leader>bd :bd<cr>

" Move between buffers
nnoremap <S-H> :bprev<cr>
nnoremap <S-L> :bnext<cr>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<cr><C-l>
" Maps <C-c> to <esc> so it triggers abbreviations
inoremap <C-c> <esc>

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

noremap <c-s> <cmd>w<cr><esc>
inoremap <c-s> <cmd>w<cr><esc>

" Better cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout
set ttimeoutlen=1
set ttyfast

" Diff colorscheme
highlight DiffAdd    cterm=none ctermfg=none ctermbg=65
highlight DiffDelete cterm=none ctermfg=none ctermbg=52
highlight DiffChange cterm=none ctermfg=none ctermbg=none
highlight DiffText   cterm=none ctermfg=none ctermbg=239

" Commentary
setglobal commentstring=#\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
