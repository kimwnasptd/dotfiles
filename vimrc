set exrc
set secure

" -------------------------------------------------------------------
" ---------------------- Vundle Setup -------------------------------
" -------------------------------------------------------------------

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Development
Plugin 'dense-analysis/ale'
Plugin 'google/vim-jsonnet'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'pedrohdz/vim-yaml-folds'

" Color scheme
Plugin 'tomasiser/vim-code-dark'

call vundle#end()

" --------------------------------------------------------------------------
" --------------------------------------------------------------------------

filetype plugin indent on    " required
syntax enable
set encoding=utf-8
set fileformats=unix,dos,mac
set clipboard^=unnamed,unnamedplus

" colorscheme
set t_Co=256
colorscheme codedark

let mapleader = ','
inoremap jk <esc>

" disable the bell
set visualbell
set t_vb=

" QuickSave and QuickExit
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:updte<CR>
inoremap <C-Z> <C-O>:update<CR>
nnoremap <C-X> :quit<CR>

" Set the configurations
set backspace=indent,eol,start
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set pastetoggle=<F2>
set mouse=a
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap lbr                " wrap lines by word

set cursorline              "Highlight current line
set showmatch               "Symbols matching []{}
set incsearch               "Searching
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <C-f> *
nmap <leader>. :NERDTree<cr>

" Tabs and enter for the popup menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Folding
set foldenable			" Shows all folds
set foldlevelstart=99	" 0->Everything is folded, 99->All folds are open
"set foldnestmax=99		" 10 nested fold max
set foldmethod=syntax	" Other folding methods are syntax
nnoremap <space> za		" space opens and closes folds

"Movement
noremap B ^
noremap E $

" Backspace and Enter
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'O<esc>'
nnoremap <BS> X

" Switch the keymap
inoremap <C-l> <C-^>

"Navigation between vim splitts and tabs
set splitbelow
set splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
nnoremap <C-w>. 10<C-w>>
nnoremap <C-w>, 10<C-w><
nnoremap <C-w>u 10<C-w>+
nnoremap <C-w>d 10<C-w>-

" copy/paste
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" easier moving of code locks
vnoremap < <gv
vnoremap > >gv
nmap <leader>v :tabedit $MYVIMRC<cr>

" Visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" find selected text with //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" NERDTree
let NERDTreeQuitOnOpen=1
nnoremap <Leader>b 3G
autocmd BufEnter * lcd %:p:h  " change curr dir to opened file

" 80 chars
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|__pycache__\|log\|dist\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Searching
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cc :cclose<CR>

" Python
let g:SimpylFold_docstring_preview=1
let python_highlight_all=1
let NERDTreeIgnore=['__pycache__', '\.pyc$', '\~$'] "ignore files in NERDTree

" LaTeX
let g:tex_flavor="latex"  "Dont use plaintext for tex files"
let g:vimtex_compiler_enabled=0
let g:tex_comment_nospell=1

" Tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> {C-h} :TmuxNavigateLeft<cr>
nnoremap <silent> {C-j} :TmuxNavigateDown<cr>
nnoremap <silent> {C-k} :TmuxNavigateUp<cr>
nnoremap <silent> {C-l} :TmuxNavigateRight<cr>
nnoremap <silent> {C-\} :TmuxNavigatePrevious<cr>

" grep
map <Leader>F :execute "silent grep! -r " . expand("<cword>") . " * " <bar> cwindow<CR>

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep!'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep!' : 'lgrep'
augroup init_quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost [^l]* redraw!
  autocmd QuickFixCmdPost l* lwindow
augroup END

augroup quickfix_tab | au!
    au filetype qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T
    au filetype qf nnoremap <buffer> <C-v> <C-w><CR><C-w>L
augroup END


" Ale
nnoremap <Leader>i :ALEHover<cr>
nnoremap <Leader>e :ALEDetail<cr>
nnoremap <Leader>f :ALEFindReferences -quickfix \| cwindow <cr>
noremap <Leader>d :ALEGoToDefinition \| vnew<cr>
noremap <Leader>D :ALEGoToDefinition \| tabnew<cr>
noremap <Leader>r :ALEReset<cr>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'vue': ['eslint'],
\   'html': ['prettier'],
\   'cpp': ['clangd-9'],
\   'python': ['flake8', 'pylsp'],
\   'go': ['golint', 'gofmt', 'goimports', 'gopls'],
\   'sh': ['language_server'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'typescript': ['prettier'],
\   'javascript': ['eslint'],
\   'html': ['prettier'],
\   'scss': ['prettier'],
\   'vue': ['eslint'],
\   'cpp': ['clang-format'],
\   'json': ['prettier'],
\   'python': ['isort', 'trim_whitespace', 'autopep8'],
\   'go': ['gofmt', 'goimports'],
\   'c': ['clang-format'],
\}

let g:ale_python_black_options = "--line-length=79"
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" For showing the command
set showcmd

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~Autocommands~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
augroup vimrc
    autocmd!

    autocmd FileType tex setlocal formatoptions+=tawcroql
    "autocmd FileType text setlocal formatoptions+=tawcroql
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    "For Closing the Preview window after an autocomplete option is selected
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " Basic 2-Tab: HTML/C++/TypeScript/JavaScript
    autocmd BufNewFile,BufRead *.html,*.cpp,*.ts,*.js,*.tsx
        \ iabbrev </ </<C-X><C-O> |
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |
        \ set textwidth=79 |
        \ set autoindent |
        \ set smartindent |
        \ set expandtab

    " Python
    autocmd BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set autoindent |
        \ set smartindent |
        \ set foldmethod=indent |
        \ set fileformat=unix

    " Spell checking
    autocmd BufWinEnter,BufRead,BufWrite *.tex
        "\ set spell spelllang=en_us,el " spell check .tex files
        \ set spell spelllang=en_us " spell check .tex files
    "autocmd BufWinEnter,BufRead,BufWrite *.txt
        "\ set spell spelllang=en_us,el " spell check .txt files
        "\ set spell spelllang=en_us " spell check .txt files
augroup END

" wsl2
if system('uname -r') =~ "microsoft"
    let s:clip = '/mnt/c/Windows/System32/clip.exe'

    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" ----------------------------------------------------
" ---------------- Functions ------------------------
" ----------------------------------------------------

function! Greek()
    set keymap=greek_utf-8
endfunction

" smart Indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()


" ----------------------------------------------------
" ---------------------------------------------------
