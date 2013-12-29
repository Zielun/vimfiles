" ===============================================================
" @file: .vimrc
" ---------------------------------------------------------------
" @author: Zielun (http://michalzielinski.pl/)
" @details: https://github.com/Zielun/vimfiles
" 
" contents:
" ---------------------
"     0. GENERAL
"     1. PLUGINS
"     2. MAPPINGS
"     3. STATUS LINE 
"
" 

" ================================
"       0. GENERAL
" ================================

set nocompatible
" set encoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set visualbell           
set noerrorbells 
set nobackup
set noswapfile
set nowb
set autowrite       "write file when switching between files
set tm=500
set backspace=2     "fix backspace
set clipboard+=unnamed
set number
set showmode
set noruler
set showmatch		"showing pairs of matching bracket 
set mousehide       "hide cursor when typing
set wildmenu
set wildmode=list:longest
set cmdheight=2
set t_Co=256

" search
set hlsearch        " highlight switch
set incsearch       " show search results while typing
set ignorecase      " ignore case when search
set smartcase       " if capital letter turn to case-sensitive

" Text, indents
set expandtab		"tabs -> spaces
set tabstop=4
set shiftwidth=4
set smarttab
set linebreak
set textwidth=500 
set autoindent
set smartindent
set wrap
set showbreak=...
" 
" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable    "open all folds
set foldlevel=1
" set foldcolumn=3

" enable pathogen
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype plugin on
filetype indent on

syntax enable
set background=dark
colorscheme ir_black

let mapleader = ","



"====================================
"		1. PLUGINS
"====================================


" let Taglist_Ctags_Cmd = "/usr/local/bin/ctags"

" NERDTree
" -----------------------------------
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd BufWinEnter * NERDTreeFind

" MRU
nmap <F1> :MRU<CR>
let MRU_Max_Entries = 150
let MRU_Window_Height = 10
let MRU_Max_Menu_Entries = 20
let MRU_Use_Current_Window = 1 

" Command-T
" -----------------------------------
let CommandTMaxFiles = 120000
let CommandTMaxDepth = 50
let g:CommandTCancelMap = "<C-x>"

" TComment
" -----------------------------------
map <leader>c <c-_><c-_>
map <leader>C <c-_>b 

" YankRing
" -----------------------------------
nnoremap <leader>p :YRShow<CR>

" Snipmate
" -----------------------------------
" au BufRead,BufNewFile *.js set ft=javascript
" au BufRead,BufNewFile *.html set ft=html

" Javascript HTML indention
" -----------------------------------
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Syntastic
" -----------------------------------
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_html_tidy_ignore_errors = ["trimming empty <span>"]
" let g:syntastic_error_symbol='!!',
" let g:syntastic_warning_symbol='~',

" Freemarker highlighting
au BufRead,BufNewFile *.ftl set filetype=ftl
au! Syntax ftl source ~/.vim/colors/ftl.vim

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" YouCompleteMe
" -----------------------------------
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt-=preview



" ==========================================
"       2. MAPPINGS
" ==========================================

"disable arrow keys
" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

" use left-right arrow keys for buffers
noremap <leader>bn :badd 
noremap <right> :bn<CR>
noremap <left> :bp<CR>

" Quick jumping to split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear search highlights
map <leader>/ :nohlsearch<CR>

" Save file that requires root and was opened without sudo
cmap w!! w !sudo tee % >/dev/null




" =============================================
"       3. STATUS LINE
" =============================================

set laststatus=2
set statusline=%f       "tail of the filename
 
"display a warning if the file format isn't Unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
 
"display a warning if file encoding isn't UTf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
 
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
 
"Syntastic!!
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

