
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set autoindent
set expandtab
set hlsearch
set incsearch
set nocompatible
set number
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
autocmd FileType make setlocal noexpandtab
setlocal spell spelllang=en_us
set nospell

syntax on

colorscheme slate

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd! BufWritePost
autocmd BufWritePost *.py silent make!

" Open the quickfix window
cope

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
autocmd FileType python compiler nose
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

set cc=+1  " highlight column after 'textwidth'
hi ColorColumn ctermbg=darkgrey guibg=darkgrey


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
