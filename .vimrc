""""""" Install Vim Plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


""""""" Initialize plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Gruvbox colorscheme
Plug 'https://github.com/morhetz/gruvbox'
" Bottom status line
Plug 'itchyny/lightline.vim'
" Syntax and indentation for many languages
Plug 'sheerun/vim-polyglot'
" Fuzzy search - requires installing 'rg' and 'ag' for searching in files - brew install rg the_silver_searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" File explorer customizations
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Floaterm
Plug 'voldikss/vim-floaterm'
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()


""""""" COLORSCHEME config
colorscheme gruvbox


""""""" NERDTree config
let NERDTreeShowHidden=1
" set encoding for NERDTree icons to show properly
set encoding=UTF-8


""""""" BOTTOM STATUS LINE config
set laststatus=2
set noshowmode
set ttimeout ttimeoutlen=50  " fix going from insert mode to normal mode status line taking long to change
" Available colors are: one solarized wombat papercolor everforest gruvbox || Each has a dark and
" light version according to the set background option. || default is powerline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode' ], [ 'readonly', 'absolutepath', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],[ 'percent' ],[ 'filetype'] ] 
  \ },
  \ 'component': { 'charvaluehex': '0x%B' },
  \ }


""""""" LEADER mappings (currently forward slash `\`)
" open NERDTree
nnoremap <leader>n :NERDTree <Cr>
" open new Floaterm window
nnoremap <leader>f :FloatermNew <Cr>


""""""" Other config
set number
set cursorline
set relativenumber
