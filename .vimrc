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
set lazyredraw                         " Don't redraw during macros
set ttyfast                            " Fast terminal connection
set redrawtime=10000                   " Increase redraw timeout

" Fix phantom characters issue
set t_RV=                              " Disable terminal version check
if has('nvim') || has('termguicolors')
  autocmd VimEnter * highlight CursorLine cterm=NONE ctermbg=NONE guibg=NONE
  " Additional fix for phantom characters
  autocmd VimEnter * set t_Co=256
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

" Better formatting (replace ALE for formatting)
Plug 'google/vim-maktaba'                                 " Required for codefmt
Plug 'google/vim-codefmt'                                 " Better code formatting
Plug 'google/vim-glaive'                                  " Configure codefmt

call plug#end()

" Configure vim-glaive (must be after plug#end())
call glaive#Install()

" === Leader Key ===
let mapleader = "\<Space>"  " Use space as leader key

" === CoC.nvim Configuration ===
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright', 'coc-json', 'coc-snippets']

" Disable CoC formatting to avoid conflicts
let g:coc_format_on_save_ignore = ['cpp', 'c', 'python']

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

" === Code Formatting Configuration ===
" Configure vim-codefmt
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-all-deps.jar"

" C++ formatting with clang-format
augroup autoformat_settings
  autocmd!
  autocmd FileType c,cpp,proto,javascript,typescript AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Custom C++ formatting settings
let g:clang_format_fallback_style = 'Google'

" Manual formatting keybindings
nnoremap <leader>f :FormatCode<CR>
vnoremap <leader>f :FormatLines<CR>

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

" === Python & C++ Specific Settings ===
augroup filetype_settings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType cpp,c setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType cpp,c setlocal cindent
  autocmd FileType cpp,c setlocal cinoptions=:0,l1,t0,g0,(0
  " Ensure proper brace formatting
  autocmd FileType cpp,c setlocal formatoptions+=croql
augroup END

" === C++ Specific Formatting Rules ===
" Custom function for proper C++ brace formatting
function! FixCppBraces()
  " Fix opening braces
  silent! %s/\s*{\s*$/\r{/g
  " Fix closing braces
  silent! %s/}\s*$/\r}/g
  " Clean up extra newlines
  silent! %s/\n\n\+/\r\r/g
endfunction

" Command to fix C++ formatting
command! FixCppFormat call FixCppBraces()

" === Auto-format on save (optional - can be disabled) ===
augroup format_on_save
  autocmd!
  " Uncomment the next lines if you want auto-format on save
  " autocmd BufWritePre *.cpp,*.c,*.h FormatCode
  " autocmd BufWritePre *.py FormatCode
augroup END

" === Final Settings ===
filetype plugin indent on
syntax enable

" Auto-install plugins on first run
if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === Additional phantom character fixes ===
" Clear screen artifacts
nnoremap <leader>r :redraw!<CR>

" Fix terminal quirks
if !has('nvim')
  set ttymouse=xterm2
endif

" Prevent cursor shape issues
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif