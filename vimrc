runtime bundle/pathogen/autoload/pathogen.vim

" Change leader key to a comma - b/c everyone does
let mapleader=","

set hidden
set nowrap
set tabstop=4
set autoindent
set copyindent
set number
set shiftwidth=4
set smartindent
set smarttab
set tw=0
set incsearch
set hlsearch
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set viminfo='100,f1

set nobackup
set noswapfile



" NERDTree settings
let NERDTreeShowBookmarks=1

" For pathogen
filetype off
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype on
filetype plugin indent on
filetype plugin on

set foldmethod=indent
set foldlevel=99
source $HOME/.vim/plugins/cscope_maps.vim

autocmd!
autocmd FileType python set nospell autoindent smartindent expandtab tabstop=4 shiftwidth=4 smarttab tw=0 list listchars=tab:>-,trail:.,extends:#,nbsp:.
autocmd FileType python compiler pylint
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py :%s/\s\+$//e
augroup gnupg
  autocmd!
  autocmd BufReadPre,FileReadPre     *.gpg set nobackup bin viminfo=
  autocmd BufReadPost,FileReadPost   *.gpg '[,']!gpg -o- 2>/dev/null
  autocmd BufReadPost,FileReadPost   *.gpg set nobin
  autocmd BufReadPost,FileReadPost   *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePost,FileWritePost *.gpg '[,']!gpg -e -o- -rtck@arbor.net > <afile>
augroup END

autocmd VimEnter * NERDTree

" ,# perl/python # comments
map ,# :s/^/#/<CR>
syntax on

let g:session_autoload='no'

" python-mode settings
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'


"folding settings
"set foldmethod=indent   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use
"
"
" bind Ctrl+<movement> keys to move around windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

"easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Easy formatting for paragraphs
vmap Q gq
nmap Q gqap

" For closing buffer in NERDTree
nnoremap <leader>q :bp<cr>:bd #<cr>
