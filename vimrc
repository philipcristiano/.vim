autocmd!

let $PYTHONPATH="/Library/Python/2.7/site-packages"

" Use system clipboard
set clipboard=unnamed

filetype plugin off
call pathogen#infect()

set autoindent
set expandtab
set hlsearch
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set nocompatible              " Don't behave like VI
set number                    " Line numbers
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set scrolloff=5               " keep at least 5 lines above/below
set noerrorbells              " Turn off error bell

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

" autocmd BufWritePost *.py silent make!

" Fonts
set guifont=Menlo\ Regular:h12

" Open the quickfix window
autocmd BufWritePost *.py :botright cope 5
autocmd QuickFixCmdPost *.py :botright cope 5

" Turn on omnicomplete
filetype plugin on
autocmd BufNewFile,BufRead *.tac set filetype=python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType java let b:SuperTabDefaultCompletionType = "context"
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Python specific
" autocmd FileType python compiler pylint
" autocmd FileType python compiler nose
" indent again when ending any of these lines
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePost *.py call Flake8()
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4

" Ruby specific
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set softtabstop=2

" PHP Specfic
autocmd FileType php set tabstop=2
autocmd FileType php set shiftwidth=2
autocmd FileType php set softtabstop=2

" YAML Specfic
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2

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

" color column 80 for Python
if version >= 730
    autocmd FileType python set cc=80
    hi ColorColumn ctermbg=darkgrey guibg=darkgrey
endif

"
" Ruby
"

autocmd FileType ruby setlocal tabstop=2

"
" Vagrant
"
"
autocmd BufNewFile,BufRead Vagrantfile setf ruby

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

" Last yanked item will be moved to register 'a' with '\ma'
noremap <leader>ma :let @a=@<CR>

if version >= 730
    set undofile
    set undodir=~/.vimundo
endif

if version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.rst setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.markdown setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
  autocmd BufNewFile,BufRead *.wiki setlocal spell spelllang=en
endif

" Syntax Check
map <Leader>c :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_markdown_checkers = ['proselint']
let g:syntastic_json_checkers = ['jsonlint']


""" CtrlP
" Map usage
map <Leader>p :CtrlP<CR>
imap <Leader>p :CtrlP<CR>
" Don't limit cache size
let g:ctrlp_max_files=0
" Use nearest .git directory as parent 'r', otherwise use cwd or parent
" directory if this file isn't in cwd
let g:ctrlp_working_path_mode = 'ra'

" Leader-d inserts datetime
nmap <Leader>d <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <Leader>d <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Erlang options

"ErlangEnableShowErrors         " Check syntax on save
let erlang_highlight_bif = 1    " Highlight built in functions
let erlang_skel_header = '{"author": {name}, "owner" : {owner}}'

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
nnoremap <C-p> :Unite -start-insert file_rec/async <cr>
nnoremap <space>/ :Unite grep:. -no-split<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Eclim
let g:EclimFileTypeValidate = 1


" Diff colorings
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=White
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=White
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=White
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=White

" Base 64 encode selection
" http://stackoverflow.com/questions/7845671/executing-base64-decode-on-a-selection-in-vim
:vnoremap <leader>64e c<c-r>=system('base64', @")<cr><esc>
:vnoremap <leader>64d c<c-r>=system('base64 --decode', @")<cr><esc>

" Insert date easily
:nnoremap <leader>d "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
:inoremap <leader>d <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
