call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab  
set number
set autoindent
set smarttab
set incsearch
set hlsearch
autocmd FileType make setlocal noexpandtab
setlocal spell spelllang=en_us
set nospell

syntax on

colorscheme slate

" Trim trailing whitespace on save
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Turn on omnicomplete 
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""" Python specific """
autocmd FileType python compiler pylint
" indent again when ending any of these lines
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Long line highlighting
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Nerdtree shouldn't show pyc files
let NERDTreeIgnore=['\.pyc']   

" Show trailing whitepace and spaces before a tab:
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
