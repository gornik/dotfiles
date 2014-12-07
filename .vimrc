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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'xolox/vim-misc'
NeoBundle 'moll/vim-bbye'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'elzr/vim-json'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tommcdo/vim-exchange'
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
set relativenumber
set laststatus=2
set guioptions-=r
set guioptions-=l
set guioptions-=L

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
" Colorscheme changes
" ---------------------------------------------------------------------------
set background=dark
colorscheme zenburn
highlight TrailingSpace term=standout ctermfg=231 ctermbg=196  gui=bold guifg=white guibg=red
highlight TrailingSpace term=standout ctermfg=231 ctermbg=196  gui=bold guifg=white guibg=red
autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpace /\s\+$/
autocmd BufWinEnter * match TrailingSpace /\s\+$/

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
nnoremap <Leader>x :Bdelete<CR>
nnoremap <Leader>X :bdelete<CR>
nnoremap <Leader>o :only<CR>

" Quickfix
au FileType qf,unite setlocal tw=79 wrap linebreak colorcolumn=0 norelativenumber
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

"Location list
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Edit vimrc
nnoremap <Leader>Ve :e $MYVIMRC<CR>
nnoremap <Leader>Vz :e ~/.zshrc<CR>

" Autoreload vimrc on save
autocmd BufWritePost .vimrc source $MYVIMRC

" Remove search highlight
nnoremap <silent><Leader><Space> :nohl<CR>

" Toggle showing invisible characters
nnoremap <silent><Leader>l :set list!<CR>

" Set how invisible characters are displayed
set listchars=tab:▸\ ,eol:¬,trail:●,extends:⦊,precedes:⦉

" Enable hidden (unsaved) buffers
set hidden

" Write as root
cnoremap w!! w !sudo tee % >/dev/null

" :W saves
cnoremap W write

" <Leader>w saves
nnoremap <silent><Leader>w :update<CR>

" Replace word under cursor
nnoremap <Leader>s :%s/\(\<<C-r><C-w>\>\)/
nnoremap <Leader>S :%s/\(\<<C-r><C-w>\>\)/<C-r><C-w>

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

" Move whole lines up and down
nnoremap <silent><C-j> :m .+1<CR>==
nnoremap <silent><C-k> :m .-2<CR>==
inoremap <silent><C-j> <Esc>:m .+1<CR>==gi
inoremap <silent><C-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-j> :m '>+1<CR>gv=gv
vnoremap <silent><C-k> :m '<-2<CR>gv=gv

" Quick split resize
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" Jump between windows
" Fillchars
set fillchars=vert:\ ,fold:\ ,diff:\ 

set scrolloff=8       " Start scrolling 8 lines from margin
set sidescrolloff=1   " Prevents from scrolling into extends/prepends signs

" Enable wildmenu
set wildmode=list:longest
set wildmenu

" Autocompletion menu
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Disable backup files
set noswapfile
set nobackup
set nowritebackup

" Persistent undo across all sessions
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile


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
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --column'
let g:unite_source_grep_recursive_opt = ''

nnoremap <silent><Leader>f :Unite -buffer-name=files -no-split -start-insert file_rec/async<CR>
nnoremap <silent><Leader>b :Unite -buffer-name=buffers -no-split -quick-match buffer<CR>
nnoremap <silent><Leader>r :Unite -buffer-name=recent -no-split file_mru<CR>
nnoremap <silent><Leader>y :Unite -buffer-name=yank -resume history/yank<CR>
nnoremap <silent><Leader>g :Unite -buffer-name=grep grep<CR>

" vim-instant-markdown
let g:instant_markdown_slow = 1

" vim-fugitive
nnoremap <silent><Leader>gs :Gstatus<CR>
nnoremap <silent><Leader>gb :Gblame<CR>

" GitGutter
nnoremap <silent><Leader>gg :GitGutterToggle<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='zenburn'

" syntastic
nnoremap <silent><Leader>c :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers=['pep8', 'pyflakes', 'python', 'pep257']
let g:syntastic_python_pep257_args="--ignore=D100,D101,D102,D103"
let g:syntastic_haskell_checkers=['ghc_mod', 'hdevtools', 'hlint', 'scan']
let g:syntastic_erlang_checkers=['']

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Language specific
" ---------------------------------------------------------------------------
au BufRead,BufNewFile *.txt,*.md set wrap linebreak nolist textwidth=0 wrapmargin=0
