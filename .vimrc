" NeoBundle config
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'hcs42/vim-erlang.git'
NeoBundle 'hcs42/vim-erlang-tags.git'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'suan/vim-instant-markdown' 
NeoBundle 'aerosol/vimerl'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'nelstrom/vim-mac-classic-theme'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'derekwyatt/vim-scala'
NeoBundleCheck

" Clear previous autocommands when reloading .vimrc
autocmd!

" Basic settings
set nocompatible
let mapleader=","
set mouse=a
syntax on
filetype plugin indent on
set nostartofline
set confirm

set splitright
set splitbelow

set number
set laststatus=2
set guioptions-=r

set encoding=utf-8
set cmdheight=2

inoremap jk <Esc>
inoremap <Esc> <NOP>

" Searching options
set ignorecase
set smartcase
set hlsearch
set incsearch

set nowrap

" Color settings
colorscheme zenburn
set background=dark

" Tabs & spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" Language specific tabs & spaces
autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab

" Show visual marker for everything beyond 80th column
execute "set colorcolumn=" . join(range(80,335), ',')

" File explorer
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>E :Ex<CR>

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>x :bdelete<CR>
nnoremap <Leader>X <C-W>c
nnoremap <Leader>o :only<CR>

" Quickfix
nnoremap <Leader>q :copen<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Edit vimrc
nnoremap <Leader>Ve :e $MYVIMRC<CR>

" Autoreload vimrc on save
autocmd BufWritePost .vimrc source $MYVIMRC

" Remove search highlight
nnoremap <silent><Leader><Space> :nohl<CR>

" Toggle showing invisible characters
nnoremap <silent><Leader>l :set list!<CR>

" Set how invisible characters are displayed
set listchars=tab:▸\ ,eol:¬,trail:\ ,extends:⦊,precedes:⦉

" Enable hidden (unsaved) buffers
set hidden

" Write as root
cnoremap w!! w !sudo tee % >/dev/null

" W saves
cnoremap W write

" <Leader>w saves
nnoremap <silent><Leader>w :update<CR>

" Replace word under cursor
nnoremap <Leader>s :%s/\(\<<C-r><C-w>\>\)/

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Space moves up and down half-screen
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>

" center when finding next word
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" move cursors works on wrapped lines
nnoremap j gj
nnoremap k gk

" netrw settings
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4 " Open file in previous buffer
let g:netrw_preview = 1      " preview window shown in a vertically split
let g:netrw_altv = 1         " preview in the right split
let g:netrw_winsize = 20     " netrw window is 20% of the available space
let g:netrw_banner = 0       " disable banner

" Show dollar sign at end of text to be changed
"set cpoptions+=$

" Move whole lines up and down
nnoremap <silent><C-j> :m .+1<CR>==
nnoremap <silent><C-k> :m .-2<CR>==
inoremap <silent><C-j> <Esc>:m .+1<CR>==gi
inoremap <silent><C-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-j> :m '>+1<CR>gv=gv
vnoremap <silent><C-k> :m '<-2<CR>gv=gv

" Minimum windows size
set winheight=3
set winminheight=3
set winwidth=5
set winminwidth=5

" Quick split resize
nnoremap - <C-W>-
nnoremap + <C-W>+

" Fillchars
set fillchars=vert:\ ,fold:\ ,diff:\ 

set scrolloff=8       " Start scrolling 8 lines from margin
set sidescrolloff=15  " Start scrolling 15 cols from the side
set sidescroll=1      " Prevents from scrolling into extends/prepends signs 

" Status line
set statusline=                 " Clear when reloaded
set statusline+=%t\             " File name relative to current dir
set statusline+=%#WarningMsg#   " Switch style to Title
set statusline+=%(%m\ %)        " Modified flag
set statusline+=%*              " Reset style
set statusline+=%(%r\ %)        " Readonly flag
set statusline+=%(%y\ %)        " File type
set statusline+=%{fugitive#statusline()} " Branch info
set statusline+=%=              " Right align
set statusline+=%#WarningMsg#   " Switch style to Title
set statusline+=\ %{getcwd()}\  " Current dir
set statusline+=%*              " Reset style
set statusline+=%(\ B:%n%)        " Buffer number
set statusline+=\ L:%l\ C:%c    " Line, column
set statusline+=\ %p%%          " File percentage


" Enable wildmenu
set wildmode=longest:full
set wildmenu
set wildignore=
set wildignore+=.hg,.git,.svn,rel
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=*.beam

" Disable backup files
set noswapfile
set nobackup
set nowritebackup

" Persistent undo across all sessions
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Helper scripts
" ---------------------------------------------------------------------------
" Show syntax highlighting groups for word under cursor
map <F10> :echo 
\ "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Colorscheme changes 
" ---------------------------------------------------------------------------
" Make Todo standout more
:hi Todo term=standout ctermfg=231 ctermbg=196 gui=bold guifg=white guibg=red

" Plugin specific
" ---------------------------------------------------------------------------

" Unite settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_data_directory = '~/.vim/tmp/unite/'
let g:unite_source_process_enable_confirm = 1
let g:unite_source_history_yank_enable = 1
let g:unite_enable_split_vertically = 0
let g:unite_winheight = 20
let g:unite_source_directory_mru_limit = 1000
let g:unite_source_file_mru_limit = 1000
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_rec_max_cache_files = 2000
let g:unite_source_history_yank_enable = 1

nnoremap <silent><Leader>t :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
nnoremap <silent><Leader>f :Unite -resume -start-insert file<CR>
nnoremap <silent><Leader>F :Unite -resume -start-insert file_rec<CR>
nnoremap <silent><Leader>b :Unite -resume buffer<CR>
nnoremap <silent><Leader>r :Unite -resume -buffer-name=recent file_mru<CR>

" vim-instant-markdown
let g:instant_markdown_slow = 1

" Language specific bindings
" ---------------------------------------------------------------------------
