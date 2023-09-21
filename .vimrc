set number
set cursorline
set relativenumber
set backspace=indent,eol,start " make backspace key work as it should on Insert mode
" set autoindent
set foldlevelstart=20

" LEADER mappings (currently forward slash `\`) 
" get git blame in current line
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
" paste from clipboard
nnoremap <Leader>p "*p
" copy into clipboard
nnoremap <Leader>c "*y
" open NERDTree
nnoremap <leader>n :NERDTree <Cr>
" open new Floaterm window
nnoremap <leader>f :FloatermNew <Cr>
" Set encoding for NERDTree icons to show properly
set encoding=UTF-8

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

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
" Git blame, I use it with <LEADER>s on a line
Plug 'zivyangll/git-blame.vim'
" YAML plugins
Plug 'dense-analysis/ale'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'Yggdroot/indentLine'
" Python - mostly followed this guy https://casas-alejandro.medium.com/your-ultimate-vim-setup-for-python-b43a522b1152 
Plug 'davidhalter/jedi-vim' " autocompletion with CTRL-space
" Floaterm
Plug 'voldikss/vim-floaterm'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"

" COLORSCHEME config
colorscheme gruvbox

" YAML config, taken from https://www.arthurkoziel.com/setting-up-vim-for-yaml/
" requires installing 'yamllint' - brew install yamllint
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set foldlevelstart=20
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:indentLine_char = '⦙'

let g:ale_linters = {'python': ['pylint']}

" Python config
"let g:jedi#environment_path = "/usr/bin/python3.9"
"
" NERDTree config
let NERDTreeShowHidden=1

" BOTTOM STATUS LINE config
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
