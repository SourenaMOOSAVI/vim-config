" === General Settings ===
set number relativenumber               " Hybrid line numbers
set tabstop=4 shiftwidth=4 expandtab   " Consistent indentation
set smartindent autoindent             " Improved indentation
set clipboard=unnamedplus              " System clipboard integration
set mouse=a                            " Enable mouse
set encoding=utf-8 fileencoding=utf-8  " UTF-8 encoding
set hidden                             " Allow hidden buffers
set updatetime=100                     " Faster updates
set timeoutlen=500                     " Shorter key sequence timeout
set termguicolors                      " Enable true colors
set cursorline                         " Highlight current line
set scrolloff=8                        " Keep lines above/below cursor
set incsearch hlsearch ignorecase smartcase  " Better search
set noswapfile                         " Disable swap files
set undofile undodir=~/.vim/undodir    " Persistent undo
set signcolumn=yes                     " Always show sign column
set splitbelow splitright              " Natural split behavior

" Workaround for phantom characters issue
if has('nvim') || has('termguicolors')
  autocmd VimEnter * highlight CursorLine cterm=NONE ctermbg=NONE guibg=NONE
endif

" Create undo directory if it doesn't exist
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p')
endif

" === Plugin Manager: vim-plug ===
call plug#begin('~/.vim/plugged')

" Core Functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}            " LSP and autocompletion
Plug 'sheerun/vim-polyglot'                               " Syntax highlighting
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}       " File explorer
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}         " Fuzzy finder
Plug 'junegunn/fzf.vim'                                   " FZF integration
Plug 'vim-airline/vim-airline'                            " Statusline
Plug 'vim-airline/vim-airline-themes'                     " Statusline themes
Plug 'tpope/vim-fugitive'                                 " Git integration
Plug 'tpope/vim-commentary'                               " Commenting
Plug 'jiangmiao/auto-pairs'                               " Auto-close brackets
Plug 'editorconfig/editorconfig-vim'                     " EditorConfig support

" Visual Enhancements
Plug 'morhetz/gruvbox'                                    " Modern colorscheme
Plug 'ryanoasis/vim-devicons'                             " File icons

" Language-Specific
Plug 'dense-analysis/ale', {'for': ['python', 'cpp']}     " Linting

call plug#end()

" === Leader Key ===
let mapleader = "\<Space>"  " Use space as leader key

" === CoC.nvim Configuration ===
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright', 'coc-json', 'coc-snippets']

" Autocomplete with <TAB>
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" LSP Mappings
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction-selected)w
nnoremap <leader>f :call CocActionAsync('format')<CR>

" Diagnostics Navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Show diagnostics in floating window
nnoremap <silent> <leader>d :CocList diagnostics<CR>

" === NERDTree Configuration ===
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
nnoremap <C-n> :NERDTreeToggle<CR>

" === FZF Configuration ===
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" === Airline Configuration ===
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" === ALE Configuration ===
let g:ale_linters = {
  \ 'python': ['flake8', 'pylint'],
  \ 'cpp': ['clangtidy']
  \}
let g:ale_fixers = {
  \ 'python': ['black', 'isort'],
  \ 'cpp': ['clang-format']
  \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Ensure proper block formatting for C++
let g:ale_cpp_clangformat_options = '-style={BasedOnStyle: Google, IndentWidth: 2}'

" === Key Mappings ===
" Commenting
nmap <leader>/ gcc
vmap <leader>/ gc

" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" === Colorscheme ===
colorscheme gruvbox
set background=dark

" === Python & C++ Specific ===
augroup filetype_settings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4
  autocmd FileType cpp setlocal tabstop=2 shiftwidth=2
augroup END

" === Final Settings ===
filetype plugin indent on
syntax enable

" Auto-install plugins on first run
if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif