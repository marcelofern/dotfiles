scriptencoding utf8

" Arch defaults
runtime! archlinux.vim

" Start configuration for Vundle and its plugins.
set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lepture/vim-jinja'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'posva/vim-vue'
Plug 'davidhalter/jedi-vim'
" the below requires cmake to be installed
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
" syntax
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'

call plug#end()
filetype plugin indent on
"------------------------


" leader config: comma is better than space.
let mapleader=","
"----------------

" Indentation.
set encoding=utf-8
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set textwidth=0 wrapmargin=0
set colorcolumn=79

au FileType python,c
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal expandtab |   "convert tabs to spaces
    \ setlocal autoindent |
    \ setlocal fileformat=unix
"-----------------------------

" Cursor configuration
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=black
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
"----------------------------

" Moving blocks identation, so multiple hits on "<" do what it is intended.
vmap < <gv
vmap > >gv
"---------

" Folding code via space bar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
"------------------


" Flaggin unecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"------------------------------------------------------------------

" Spell check
nnoremap <F6> :setlocal spell! spelllang=en_gb<CR>
"-------------------------------------------------


" Using jedi for python files only instead of YCM. Definition command is better
let g:jedi#goto_definitions_command = "<F12>"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0   "Remove completion as it is very slow.
let g:jedi#show_call_signatures = "0"  "call signatures can be slow too.
" ---------------------------------

" YCM (you complete me) configuration.
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {'python': 1, 'py': 1}

" Max number of completion suggestions 
let g:ycm_max_num_candidates = 5

nnoremap <F10> :tab split \| YcmCompleter GoToDeclaration<CR>
nnoremap <F12> :tab split \| YcmCompleter GoToDefinition<CR>
nnoremap <F9> :tab split \| YcmCompleter GoToReferences<CR>
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"-----------------------------------

" Highlight word "self" in python files.
autocmd BufReadPost *.py syn match pythonBoolean "\(\W\|^\)\@<=self\(\.\)\@="
"----------------------------------------------------------------------------

" Colour scheme
set termguicolors
set background=dark
"set background=light
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
"------------------

" nerdtree (file browsing) configuration
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
" ------------------------------

" line configuration
set nu
set relativenumber
let b:comment_leader = '//'
autocmd FileType sh,ruby,python,perl   let b:comment_leader = '#'
autocmd FileType conf,fstab            let b:comment_leader = '#'
autocmd FileType tex                   let b:comment_leader = '%'
autocmd FileType mail                  let b:comment_leader = '>'
autocmd FileType vim                   let b:comment_leader = '"'
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>
"------------------------------------------------------------------------------------------------------------------------

" Search configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
  \  'PrtInsert("c")': ['<MiddleMouse>', '<insert>', '<c-v>'] }
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_max_files=0
"highligh search
:set hlsearch
let g:ackhighlight=1
set ignorecase
set smartcase     " ignore case if search pattern is all lowercase,
"Ack configs"
cnoreabbrev ack Ack!
let g:ackpreview=0
let g:ackprg = 'rg -S --vimgrep --no-heading'
let g:ack_mappings = {
      \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }
"-------------------------------------------

" Splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" always split below or right
set splitbelow
set splitright
"------------

" Enable mouse.
set mouse=a
"----------

" I want to use backspace rather than only "d"
set backspace=2
"--------------

" Pontuation lint
set showbreak=↪\ 
set listchars=tab:\|_,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
"-------

" Saving and closing hotkeys
nnoremap <C-w> :q<CR>
nnoremap <C-s> :w<CR>
"-------------------

" Resizing
map + :vertical resize +2<CR>
map - :vertical resize -2<CR>
map _ :vertical resize 85<CR>
"---------------------------

" tabs
noremap <leader>t :tabnew<CR>
"----------------------------

" allow copy to clipboard
set clipboard+=unnamedplus
"------------------------

" git commands
set updatetime=100
noremap <Leader>gc :GitGutterUndoHunk<CR>
noremap <Leader>gn :GitGutterNextHunk<CR>
noremap <Leader>gp :GitGutterPrevHunk<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gdiff<CR>
"----------------------------

" jinja config
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.jinja,*.jinja2 set ft=jinja
"-----------------------------------------------------------------------------

" tagbar
noremap <F8> :TagbarToggle<CR>
"-----------------------------

" debug
au BufNewFile,BufRead *.py noremap <F1> :normal oimport ipdb; ipdb.set_trace()<ESC>
au BufNewFile,BufRead *.py noremap <F2> :g/^.*import ipdb; ipdb.set_trace().*/d<CR>
"----------------------------------------------------------------------------------

" easy motion
nmap <Leader><leader>f <Plug>(easymotion-overwin-f)
nmap <Leader><leader>F <Plug>(easymotion-overwin-F)
nmap <Leader><leader>w <Plug>(easymotion-overwin-w)
nmap <C-F> <Plug>(easymotion-overwin-w)
nmap <Leader><leader>W <Plug>(easymotion-overwin-W)
nmap <Leader><leader>. <Plug>(easymotion-repeat)
"-----------------------------------------------

" goyo (reader)
noremap <leader>go :Goyo<CR>
"---------------------------

" wiki
highlight VimwikiHeader1 guifg=#fabd2f
highlight VimwikiHeader2 guifg=#b8bb26
highlight VimwikiHeader3 guifg=#8ec07c
let g:vimwiki_list = [{'path': '~/workspace/vimwiki/'}]
"------------------------------------------------------
"
" Ale linter, which works for C as well using clang.
let b:ale_linters = {
  \'javascript': ['eslint'],
  \'python': ['flake8'],
  \'c': ['cc', 'clangtidy']
\}
let g:ale_c_cc_options = '-std=c17 -Wall'
let g:ale_linters_explicit = 1 "Ale will only run on the list above.
let g:ale_lint_delay = 500 "milliseconds delay after typing trigger
"-------------------------------------------------------------------
