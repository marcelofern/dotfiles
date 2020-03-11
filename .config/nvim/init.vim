scriptencoding utf8


" Arch defaults
runtime! archlinux.vim


" -------------- CONFIGURATION FOR VUNDLE (pip for vim) AND ITS PLUGINS --------------
set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
"Plug 'Valloric/YouCompleteMe', { 'do': 'make' }
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'aonemd/kuroi.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'kh3phr3n/python-syntax'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'lepture/vim-jinja'
Plug 'majutsushi/tagbar'

" All Plugs must be added before the following line
call plug#end()
filetype plugin indent on

" -------------- END CONFIGURATION FOR VUNDLE (pip for vim) --------------


" -------------- LEADER CONFIG --------------
let mapleader=","
" -------------- END LEADER CONFIG --------------


" -------------- IDENTENTATION CONFIG --------------
set encoding=utf-8
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set textwidth=0 wrapmargin=0
set colorcolumn=79

"au BufNewFile,BufRead *.py
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=4 |
    "\ set expandtab |   "convert tabs to spaces
    "\ set autoindent |
    "\ set fileformat=unix
au FileType python
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal expandtab |   "convert tabs to spaces
    \ setlocal autoindent |
    \ setlocal fileformat=unix
" -------------- END OF IDENTENTATION CONFIG --------------


" -------------- CURSOR HIGHLIGHT CONFIG --------------
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=black
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" -------------- END OF CURSOR HIGHLIGHT CONFIG --------------


" -------------- CODE FOLD CONFIG --------------
" hit the space bar to fold code.
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" -------------- END CODE FOLD CONFIG --------------


" -------------- FLAGGING UNNECESSARY WHITE SPACE CONFIG --------------
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" -------------- END FLAGGING UNNECESSARY WHITE SPACE CONFIG --------------


" -------------- JEDI AUTO COMPLETION (PYTHON) CONFIG --------------
"set omnifunc=jedi#completions
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#goto_assignments_command = "<F10>"
"let g:jedi#goto_definitions_command = "<F12>"
"let g:jedi#usages_command = "<F9>"
"let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#show_call_signatures = "1"
" -------------- END JEDI AUTO COMPLETION (PYTHON) CONFIG -------------


" -------------- YOU COMPLETE ME AUTO COMPLETION (PYTHON) CONFIG --------------
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <F10> :YcmCompleter GoToDeclaration<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F9> :YcmCompleter GoToReferences<CR>
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" -------------- YOU COMPLETE ME  AUTO COMPLETION (PYTHON) CONFIG --------------


" -------------- PYTHON SYNTAX AND HIGHLIGHT CONFIG --------------
autocmd BufReadPost *.py syn match pythonBoolean "\(\W\|^\)\@<=self\(\.\)\@="
let python_highlight_all=1
syntax on
" -------------- END PYTHON SYNTAX AND HIGHLIGHT CONFIG --------------


" -------------- COLOR SCHEMAS --------------
set termguicolors
set background=dark
"set background=light
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italicize_strings = 1
"colorscheme kuroi
colorscheme gruvbox
"colorscheme solarized
"colorscheme zenburn
" -------------- END COLOR SCHEMAS --------------


" -------------- NERDTREE (FILE BROWSING) CONFIGURATION --------------
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
" -------------- END NERDTREE (FILE BROWSING) CONFIGURATION --------------


" -------------- LINE CONFIGURATION --------------
set nu
set relativenumber
"line commenting commands
let b:comment_leader = '//'
autocmd FileType sh,ruby,python,perl   let b:comment_leader = '#'
autocmd FileType conf,fstab            let b:comment_leader = '#'
autocmd FileType tex                   let b:comment_leader = '%'
autocmd FileType mail                  let b:comment_leader = '>'
autocmd FileType vim                   let b:comment_leader = '"'
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>
" -------------- END LINE CONFIGURATION --------------


" -------------- SEARCH CONFIGURATION --------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"highligh search
:set hlsearch
let g:ackhighlight=1
set ignorecase
set smartcase     " ignore case if search pattern is all lowercase,
"Ack configs"
cnoreabbrev ack Ack!
let g:ackpreview=1
let g:ackprg = 'rg -S --vimgrep --no-heading'
let g:ack_mappings = {
      \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }
" -------------- END SEARCH CONFIGURATION --------------


" -------------- SPLIT NAVIGATION CONFIGURATION --------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" always split below or right
set splitbelow
set splitright
" -------------- END SPLIT NAVIGATION CONFIGURATION --------------


" -------------- MOUSE CONFIGURATION --------------
set mouse=a
" -------------- END MOUSE CONFIGURATION --------------


" -------------- BACKSPACE CONFIGURATION --------------
set backspace=2
" -------------- END BACKSPACE CONFIGURATION --------------


" -------------- PONTUATION LINT CONFIGURATION --------------
set showbreak=↪\ 
set listchars=tab:\|_,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
" -------------- END PONTUATION LINT CONFIGURATION --------------


" -------------- SAVING AND CLOSING CONFIGURATION --------------
nnoremap <C-w> :q<CR>
nnoremap <C-s> :w<CR>
" -------------- SAVING AND CLOSING CONFIGURATION -------------


" -------------- SAVING AND CLOSING CONFIGURATION -------------
"increase/decrease tabs size"
map + :vertical resize +2<CR>
map - :vertical resize -2<CR>
map _ :vertical resize 85<CR>
" -------------- END SAVING AND CLOSING CONFIGURATION ------------


" -------------- COPYING TO CLIPBOARD POSSIBILITY -----------
set clipboard+=unnamedplus
" -------------- SAVING AND CLOSING CONFIGURATION ----------


" -------------- GIT COMMAND CONFIG -----------
set updatetime=100
noremap <Leader>gc :GitGutterUndoHunk<CR>
noremap <Leader>gn :GitGutterNextHunk<CR>
noremap <Leader>gp :GitGutterPrevHunk<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gdiff<CR>
" -------------- END GIT COMMAND CONFIG----------


" -------------- JINJA CONFIG ----------- "
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.jinja,*.jinja2 set ft=jinja
" -------------- END JINJA CONFIG----------


" -------------- TAGBAR CONFIG ----------- "
noremap <F8> :TagbarToggle<CR>
" -------------- END TAGBAR CONFIG----------


" -------------- PYTHON DEBUG CONFIG ----------- "
noremap <F1> :normal oimport ipdb; ipdb.set_trace()<ESC>
noremap <F2> :g/^.*import ipdb; ipdb.set_trace().*/d<CR>
" -------------- END PYTHON DEBUG  CONFIG----------


" -------------- NOTES CONFIG-------------"
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:notes_list_bullets = ['-', '+']
" -------------- END NOTES CONFIG---------"
