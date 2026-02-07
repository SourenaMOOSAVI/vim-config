" === General Settings ===
set number relativenumber               " Hybrid line numbers
set tabstop=4 shiftwidth=4 expandtab   " Consistent indentation
set smartindent autoindent             " Improved indentation
set clipboard=unnamedplus              " System clipboard integration
set mouse=a                            " Enable mouse
set encoding=utf-8 fileencoding=utf-8  " UTF-8 encoding
set hidden                             " Allow hidden buffers
set updatetime=100                     " Faster updates
" set timeoutlen=500                     " Shorter key sequence timeout (Disabled to avoid command issues)
set termguicolors                      " Enable true colors
set cursorline                         " Highlight current line
set scrolloff=8                        " Keep lines above/below cursor
set sidescrolloff=8                    " Keep columns left/right of cursor
set incsearch hlsearch ignorecase smartcase  " Better search
set noswapfile                         " Disable swap files
set undofile undodir=~/.vim/undodir    " Persistent undo
set signcolumn=yes                     " Always show sign column
set splitbelow splitright              " Natural split behavior
" set lazyredraw                         " Don't redraw during macros (Disabled to fix UI lag)
set ttyfast                            " Fast terminal connection
set redrawtime=10000                   " Increase redraw timeout
set wildmenu wildmode=longest:full,full " Better command completion
set completeopt=menuone,noinsert,noselect " Better completion experience
set pumheight=10                       " Limit popup menu height

" Performance improvements
set synmaxcol=300                      " Don't highlight very long lines
set re=1                               " Use old regex engine (sometimes faster)

" Fix phantom characters issue
set t_RV=                              " Disable terminal version check
if has('nvim') || has('termguicolors')
  autocmd VimEnter * highlight CursorLine cterm=NONE ctermbg=NONE guibg=NONE
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
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'} " Git status in NERDTree
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}         " Fuzzy finder
Plug 'junegunn/fzf.vim'                                   " FZF integration
Plug 'vim-airline/vim-airline'                            " Statusline
Plug 'vim-airline/vim-airline-themes'                     " Statusline themes
Plug 'tpope/vim-fugitive'                                 " Git integration
Plug 'airblade/vim-gitgutter'                            " Git diff in gutter
Plug 'tpope/vim-commentary'                               " Commenting
Plug 'tpope/vim-surround'                                 " Surround text objects
Plug 'tpope/vim-repeat'                                   " Repeat plugin commands
Plug 'jiangmiao/auto-pairs'                               " Auto-close brackets

Plug 'editorconfig/editorconfig-vim'                     " EditorConfig support

" Testing & Detection
Plug 'vim-test/vim-test'                                  " Run tests inside Vim
Plug 'tpope/vim-sleuth'                                   " Auto-detect indent settings

" Visual Enhancements
Plug 'morhetz/gruvbox'                                    " Modern colorscheme
Plug 'ryanoasis/vim-devicons'                             " File icons
Plug 'Yggdroot/indentLine'                               " Show indentation levels

" Better formatting
Plug 'google/vim-maktaba'                                 " Required for codefmt
Plug 'google/vim-codefmt'                                 " Better code formatting
Plug 'google/vim-glaive'                                  " Configure codefmt

" Additional useful plugins
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}         " Visualize undo tree
Plug 'machakann/vim-highlightedyank'                     " Highlight yanked text
Plug 'justinmk/vim-sneak'                                " Better f/F navigation

call plug#end()

" === Leader Key ===
let mapleader = "\<Space>"  " Use space as leader key
let maplocalleader = ","    " Use comma as local leader

" === CoC.nvim Configuration ===
let g:coc_global_extensions = [
  \ 'coc-clangd', 
  \ 'coc-pyright', 
  \ 'coc-json', 
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-git'
\ ]

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

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" LSP Mappings
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction-selected)
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>qf <Plug>(coc-fix-current)

" Diagnostics Navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Show diagnostics in floating window
nnoremap <silent> <leader>d :CocList diagnostics<CR>

" === NERDTree Configuration ===
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Close vim if only NERDTree is left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" === FZF Configuration ===
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>: :Commands<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
\ }

" === Airline Configuration ===
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1

" === IndentLine Configuration ===
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" === Git Configuration ===
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_preview_win_floating = 1

" Git mappings
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" === UndoTree Configuration ===
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" === Sneak Configuration ===
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" === Code Formatting Configuration ===
augroup codefmt_config
  autocmd!
  autocmd VimEnter * call SetupCodefmt()
augroup END

function! SetupCodefmt()
  if exists('*glaive#Install')
    call glaive#Install()
    Glaive codefmt plugin[mappings]
    
    augroup autoformat_settings
      autocmd!
      autocmd FileType c,cpp,proto,javascript,typescript AutoFormatBuffer clang-format
      autocmd FileType python AutoFormatBuffer autopep8
    augroup END
  endif
endfunction

let g:clang_format_fallback_style = '{BasedOnStyle: Google, IndentWidth: 4, BreakBeforeBraces: Allman, PointerAlignment: Left, SortIncludes: false, ColumnLimit: 100}'

" Manual formatting keybindings
nnoremap <leader>f :call SmartFormat()<CR>
vnoremap <leader>f :call SmartFormatRange()<CR>

function! SmartFormat()
  if exists(':FormatCode')
    FormatCode
  else
    normal! gg=G
  endif
endfunction

function! SmartFormatRange() range
  if exists(':FormatLines')
    FormatLines
  else
    normal! gv=
  endif
endfunction

" === Key Mappings ===
" Commenting
nmap <leader>/ gcc
vmap <leader>/ gc

" Clear search highlight
nnoremap <leader><CR> :nohlsearch<CR>

" Better escape
inoremap jk <Esc>
inoremap kj <Esc>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bD :bdelete!<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>

" Better movement
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Center screen on search
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Quick save and quit
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>Q :qall<CR>

" === Colorscheme ===
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" === Python & C++ Specific Settings ===
augroup filetype_settings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType cpp,c setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType cpp,c setlocal cindent
  autocmd FileType cpp,c setlocal cinoptions=:0,l1,t0,g0,(0
  autocmd FileType cpp,c setlocal formatoptions+=croql
  
  " Additional language settings
  autocmd FileType javascript,typescript,json setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType html,css,scss setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" === Vim-Test Configuration ===
let test#strategy = "vimterminal"
if has('nvim')
  let test#strategy = "neovim"
endif

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>lt :TestLast<CR>
nmap <silent> <leader>gt :TestVisit<CR>

" === C++ Specific Formatting Rules ===
function! FixCppBraces()
  silent! %s/\s*{\s*$/\r{/g
  silent! %s/}\s*$/\r}/g
  silent! %s/\n\n\+/\r\r/g
endfunction

command! FixCppFormat call FixCppBraces()

" === Performance Optimizations ===
" Faster scrolling
set scrolljump=5

" Disable some features in large files
augroup large_file_optimizations
  autocmd!
  autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | setlocal noswapfile | endif
augroup END

" === Auto Commands ===
augroup misc_autocmds
  autocmd!
  " Return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  
  " Automatically close quickfix window if it's the only window left
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | q | endif
  
  " Auto-save when focus is lost
  autocmd FocusLost * :wa
  
  " Highlight trailing whitespace
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

" === Final Settings ===
filetype plugin indent on
syntax enable

" Auto-install plugins on first run
if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === Additional phantom character fixes ===
nnoremap <leader>r :redraw!<CR>

if !has('nvim')
  set ttymouse=sgr
endif

" Prevent cursor shape issues
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif