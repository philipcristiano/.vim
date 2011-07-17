filetype plugin off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set autoindent
set expandtab
set hlsearch
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set nocompatible
set number
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set scrolloff=5               " keep at least 5 lines above/below

" Fix backspace
set bs=2

autocmd FileType make setlocal noexpandtab
setlocal spell spelllang=en_us
set nospell

syntax on

" Code Folding
set foldmethod=indent
set foldlevel=99

colorscheme slate

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"autocmd BufWritePost *.py silent make!

" Fonts
set guifont=Menlo\ Regular:h12

" Open the quickfix window
"autocmd BufWritePost botright cope 2

" Turn on omnicomplete
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Python specific
autocmd FileType python compiler pylint
" autocmd FileType python compiler nose
" indent again when ending any of these lines
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Notify on common syntax errors
syn match pythonError "^\s*def\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*class\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*for\s.*[^:]$" display
syn match pythonError "^\s*except\s*$" display
syn match pythonError "^\s*finally\s*$" display
syn match pythonError "^\s*try\s*$" display
syn match pythonError "^\s*else\s*$" display
syn match pythonError "^\s*else\s*[^:].*" display
syn match pythonError "^\s*if\s.*[^\:]$" display
syn match pythonError "^\s*except\s.*[^\:]$" display
syn match pythonError "[;]$" display
syn keyword pythonError         do

" Long line highlighting
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" color coloumn 80 for Python
if version >= 730
    autocmd FileType python set cc=80
    hi ColorColumn ctermbg=darkgrey guibg=darkgrey
endif


" Highlight trailing whitespace
highlight TrailingWhitespace ctermbg=red ctermfg=white guibg=#592929
match TrailingWhitespace /\s\+$/

" Nerdtree shouldn't show pyc files
let NERDTreeIgnore=['\.pyc']

" Show trailing whitepace and spaces before a tab:
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Don't want backup files
set nobackup
set nowritebackup
set noswapfile

" Bash-like filenames
set wildmode=longest,list,full
set wildmenu

" Map gundotoggle to F5
nnoremap <F5> :GundoToggle<CR>

if version >= 730
    set undofile
    set undodir=~/.vimundo
endif
