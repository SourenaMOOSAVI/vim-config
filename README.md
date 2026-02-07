# Vim Configuration

A comprehensive, modern Vim configuration designed for enhanced productivity with professional-grade plugins, intuitive key mappings, and robust language support. This setup provides a powerful development environment with LSP integration, intelligent code formatting, Git workflow integration, and a clean, efficient interface optimized for Python, C++, and web development.

## ✨ Key Features

### Core Functionality
- **🔢 Hybrid Line Numbers**: Combines absolute and relative numbering for optimal navigation
- **📋 System Clipboard Integration**: Seamless copy/paste with system clipboard (`+` register)
- **🖱️ Full Mouse Support**: Complete mouse interaction for modern workflows
- **💾 Persistent Undo**: Maintains undo history across sessions in `~/.vim/undodir`
- **🎨 True Color Support**: Vibrant colors with `termguicolors` enabled
- **🚀 Performance Optimized**: Fast redraw, large file handling, and optimized settings
- **⚡ Smart Completion**: Enhanced popup menu with better completion experience

### Enhanced Navigation & Editing
- **🎯 Advanced Text Objects**: vim-surround for powerful text manipulation
- **🔍 Enhanced Search**: Sneak navigation with labeled jumps for lightning-fast movement
- **📍 Visual Feedback**: Highlighted yank operations and indentation guides
- **⏪ Undo Tree Visualization**: Visual undo history with undotree
- **🎪 Better Escapes**: `jk`/`kj` escape alternatives for faster editing

### Language Support & Formatting
- **📝 Intelligent Indentation**: 4-space default, 2-space for C/C++/JS/HTML, with smart auto-indent
- **🔧 Advanced Code Formatting**: Google's vim-codefmt for reliable, consistent formatting
- **🎯 Multi-Language Settings**: Tailored configurations for Python, C++, JavaScript, TypeScript, HTML, CSS, YAML
- **🛠️ LSP Integration**: Full Language Server Protocol support via CoC.nvim with extended language support

### Git Integration
- **📊 Git Gutter**: Live diff visualization in the sign column
- **🌿 Branch Information**: Current branch display in statusline
- **🔀 Hunk Management**: Stage, unstage, and preview individual changes
- **📁 Git-Aware File Explorer**: NERDTree with Git status indicators
- **⚡ Fugitive Integration**: Full Git workflow support

### Plugin Ecosystem
- **🧠 CoC.nvim**: Advanced LSP with autocompletion for Python, C++, JSON, Git, and more
- **📁 Enhanced NERDTree**: Intuitive file explorer with Git integration and minimal UI
- **🔍 Powerful FZF**: Lightning-fast fuzzy finding with multiple search modes
- **✈️ Advanced Airline**: Beautiful statusline with comprehensive integrations
- **🎨 Refined Gruvbox**: Professional, high-contrast colorscheme with improved settings
- **🌈 vim-polyglot**: Superior syntax highlighting for 600+ languages
- **💬 Smart Commenting**: Intelligent commenting with vim-commentary
- **🔗 Enhanced Pairing**: Automatic bracket/quote pairing with CoC pairs integration

## 🚀 Quick Start

### Prerequisites

Ensure you have the following installed:

```bash
# Required
vim >= 8.0 (or neovim)
git
node.js >= 14.0

# Language-specific tools
# Python
pip install flake8 pylint black isort autopep8

# C++ (choose your package manager)
# Ubuntu/Debian:
sudo apt install clang-format clang-tidy
# macOS:
brew install clang-format
# Arch:
sudo pacman -S clang

# Optional but highly recommended
fzf  # For fuzzy finding
ripgrep  # For content search

# For best experience
# Install a Nerd Font for file icons:
# https://www.nerdfonts.com/font-downloads
```

### Installation

1. **Clone this repository**
   ```bash
   git clone https://github.com/SourenaMOOSAVI/vim-config.git ~/vim-config
   ```

2. **Create symbolic link**
   ```bash
   ln -sf ~/vim-config/.vimrc ~/.vimrc
   ```

3. **Install vim-plug (plugin manager)**
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. **Install plugins**
   ```bash
   vim +PlugInstall +qall
   ```

   ```bash
   vim +PlugInstall +qall
   ```

5. **Install CoC extensions**
   ```vim
   # Inside Vim:
   :CocInstall coc-clangd coc-pyright coc-json coc-snippets coc-pairs coc-git
   ```

### Verification

Test your installation:
```bash
# Check if formatting tools are available
which clang-format black autopep8

# Open a test file
vim test.cpp
```

## 🎯 Usage Guide

### Essential Key Mappings

**Leader Key**: `<Space>` (all leader commands start with spacebar)
**Local Leader**: `,` (for buffer-specific commands)

#### File & Buffer Management
| Key | Action | Description |
|-----|---------|-------------|
| `<C-n>` | Toggle NERDTree | Open/close file explorer |
| `<leader>nf` | Find in NERDTree | Locate current file in tree |
| `<C-p>` | Files | FZF file search |
| `<leader>b` | Buffers | List open buffers |
| `<leader>rg` | Ripgrep | Search file contents |
| `<leader>l` | Buffer Lines | Search lines in current buffer |
| `<leader>h` | History | Recent files |
| `<leader>:` | Commands | Command palette |
| `<leader>bn/bp` | Buffer Next/Previous | Navigate buffers |
| `<leader>bd` | Buffer Delete | Close current buffer |
| `<leader>bD` | Force Buffer Delete | Force close buffer |

#### Enhanced Navigation
| Key | Action | Description |
|-----|---------|-------------|
| `jk` / `kj` | Escape | Alternative escape sequences |
| `j` / `k` | Smart Movement | Move by display lines |
| `gj` / `gk` | Real Lines | Move by actual lines |
| `s{char}{char}` | Sneak | Jump to character pair |
| `n` / `N` | Centered Search | Search with auto-centering |
| `<Alt-j/k>` | Move Lines | Move current line up/down |

#### Code Navigation & LSP
| Key | Action | Description |
|-----|---------|-------------|
| `K` | Hover Info | Show documentation |
| `gd` | Go to Definition | Jump to definition |
| `gy` | Go to Type | Jump to type definition |
| `gi` | Go to Implementation | Jump to implementation |
| `gr` | References | Show all references |
| `<leader>rn` | Rename | Rename symbol |
| `<leader>ca` | Code Actions | Show available actions |
| `<leader>qf` | Quick Fix | Apply quick fix |
| `[g` / `]g` | Diagnostics | Previous/next diagnostic |
| `<leader>d` | Diagnostics List | Show all diagnostics |

#### Git Integration
| Key | Action | Description |
|-----|---------|-------------|
| `<leader>gp` | Preview Hunk | Show diff in popup |
| `<leader>gs` | Stage Hunk | Stage current hunk |
| `<leader>gu` | Undo Hunk | Undo hunk changes |
| `[c` / `]c` | Hunk Navigation | Previous/next hunk |

#### Code Formatting & Editing
| Key | Action | Description |
|-----|---------|-------------|
| `<leader>f` | Format Code | Format current buffer |
| `<leader>/` | Comment Toggle | Comment/uncomment lines |
| `<leader><CR>` | Clear Highlight | Clear search highlights |
| `<leader>r` | Redraw | Fix phantom characters |
| `<` / `>` (visual) | Smart Indent | Keep selection when indenting |

#### Window Management
| Key | Action | Description |
|-----|---------|-------------|
| `<C-h/j/k/l>` | Window Move | Navigate between splits |
| `<C-Left/Right>` | Resize Horizontal | Adjust window width |
| `<C-Up/Down>` | Resize Vertical | Adjust window height |

#### Quick Actions
| Key | Action | Description |
|-----|---------|-------------|
| `<leader>w` | Save | Write current buffer |
| `<leader>q` | Quit | Quit current window |
| `<leader>Q` | Quit All | Quit all windows |
| `<leader>u` | Undo Tree | Toggle undo tree |

#### Autocompletion
| Key | Action | Description |
|-----|---------|-------------|
| `<TAB>` | Next Completion | Navigate completion menu |
| `<S-TAB>` | Previous Completion | Navigate backwards |
| `<CR>` | Accept Completion | Confirm selection |
| `<C-Space>` | Trigger Completion | Force completion menu |

#### Testing
| Key | Action | Description |
|-----|---------|-------------|
| `<leader>t` | Test Nearest | Run nearest test |
| `<leader>T` | Test File | Run tests in file |
| `<leader>a` | Test Suite | Run all tests |
| `<leader>lt` | Test Last | Re-run last test |
| `<leader>gt` | Visit Test | Open test file |

### Advanced Features

#### Enhanced Git Workflow
This configuration provides comprehensive Git integration:

```vim
# View Git status in NERDTree
<C-n>  # File status indicators show modified/staged files

# Preview changes without opening
<leader>gp  # Show diff popup for current hunk

# Stage individual changes
<leader>gs  # Stage hunk under cursor

# Navigate through changes
[c / ]c     # Jump between hunks
```

#### Code Formatting Excellence
Uses Google's vim-codefmt with language-specific configurations:

```vim
# Format entire buffer
<leader>f

# Format selected lines (visual mode)
<leader>f

# Language-specific formatting:
# C/C++: clang-format with Google style
# Python: autopep8 for PEP 8 compliance
# Auto-detects and applies appropriate formatter
```

#### Smart Search & Navigation
Multiple search modes with FZF integration:

```vim
# File search with preview
<C-p>        # Files in project

# Content search
<leader>rg   # Search text with ripgrep
<leader>l    # Search lines in current buffer

# Navigation history
<leader>h    # Recently opened files
<leader>:    # Available commands

# Enhanced movement
s{char}{char} # Sneak jump (labeled targets)
```

#### Visual Enhancements
- **Indentation Guides**: Clear visual indentation levels
- **Git Gutter**: Live diff indicators in sign column  
- **Highlight Yank**: Visual feedback for copy operations
- **Trailing Whitespace**: Automatic highlighting of extra spaces
- **Enhanced Statusline**: Comprehensive information display

#### Intelligent Editing
```vim
# Alternative escape methods
jk / kj      # Faster than reaching for Esc

# Line manipulation
<Alt-j/k>    # Move lines up/down with auto-indent

# Smart visual selection
< / >        # Indent while keeping selection

# Auto-center navigation
n / N        # Search results stay centered
```

### File Explorer (NERDTree)
- **Toggle**: `<C-n>`
- **Find Current**: `<leader>nf`
- **Features**: Git status, hidden files, minimal UI, auto-close
- **Navigation**: Standard vim keys with file icons

### Fuzzy Finding (FZF)
Enhanced fuzzy finding with multiple modes:
- **Files**: `<C-p>` - Find and open files with preview
- **Buffers**: `<leader>b` - Switch between open buffers  
- **Content**: `<leader>rg` - Search inside files (requires ripgrep)
- **Lines**: `<leader>l` - Search current buffer lines
- **History**: `<leader>h` - Recent files
- **Commands**: `<leader>:` - Command palette

## 🔧 Customization

### Adding New Languages
```vim
# Add to the CoC extensions list
let g:coc_global_extensions = [
  \ 'coc-clangd', 'coc-pyright', 'coc-json', 'coc-snippets',
  \ 'coc-rust-analyzer', 'coc-go', 'coc-tsserver'
\ ]

# Add language-specific settings
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType go setlocal tabstop=8 shiftwidth=8 noexpandtab
```

### Customizing Appearance
```vim
# Gruvbox variants
let g:gruvbox_contrast_dark = 'hard'    # or 'soft', 'medium'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

# Alternative colorschemes
colorscheme molokai
colorscheme nord
```

### Custom Key Mappings
```vim
# Add to .vimrc after existing mappings
nnoremap <leader>t :terminal<CR>           " Open terminal
nnoremap <F5> :w<CR>:!python %<CR>         " Run Python file
nnoremap <leader>m :make<CR>               " Build project
nnoremap <leader>e :Explore<CR>            " File explorer

### Testing
```vim
<leader>t   # Test nearest
<leader>T   # Test file
<leader>a   # Test suite
<leader>lt  # Test last
<leader>gt  # Visit test file
```
```

### Plugin Management
```vim
# Add new plugins between plug#begin() and plug#end()
Plug 'preservim/vim-markdown'              " Enhanced markdown
Plug 'iamcco/markdown-preview.nvim'        " Live markdown preview

# Then run:
:PlugInstall
:PlugUpdate    # Update existing plugins
:PlugClean     # Remove unused plugins
```

### Performance Tuning
```vim
# For very large files (adjust in .vimrc)
let g:large_file_size = 2000000    # 2MB threshold
autocmd BufReadPre * if getfsize(expand("%")) > g:large_file_size | 
  \ setlocal noswapfile nobackup noundofile |
  \ syntax off |
  \ endif
```

## 🛠️ Troubleshooting

### Common Issues

#### Plugins Not Loading
```bash
# Check vim-plug installation
ls ~/.vim/autoload/plug.vim

# Reinstall if missing
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Update and clean plugins
vim +PlugUpdate +PlugClean +qall
```

#### LSP/CoC Issues
```vim
# Check CoC status and health
:CocInfo
:checkhealth coc

# Check installed extensions
:CocList extensions

# Reinstall all extensions
:CocInstall coc-clangd coc-pyright coc-json coc-snippets coc-pairs coc-git

# View CoC logs for debugging
:CocOpenLog
```

#### Formatting Problems
```bash
# Verify formatters are installed and accessible
which clang-format black autopep8
echo $PATH

# Install missing Python formatters
pip install --upgrade black autopep8 isort flake8

# Test formatting manually
clang-format --version
black --version
```

#### Git Integration Issues
```bash
# Ensure Git is available
git --version

# Check if repository is properly initialized
git status

# Restart vim after Git setup changes
```

#### Performance Issues
```vim
# Check startup time
vim --startuptime startup.log

# Disable problematic plugins temporarily
# Comment out plugin lines and run :PlugClean

# Check for large files causing slowdowns
:echo getfsize(expand("%"))
```

#### Icons Not Showing
1. Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) (recommended: JetBrains Mono Nerd Font)
2. Set it as your terminal font
3. Restart terminal and vim
4. Verify with `:echo has('gui_running')` and `:set encoding?`

#### Phantom Characters/Display Issues
- Press `<leader>r` to redraw screen
- Check terminal compatibility: `:echo &termguicolors`
- Try different terminal emulators (iTerm2, Alacritty, etc.)
- Disable problematic settings temporarily

### Debug Mode
```vim
# Comprehensive debugging
:version                    # Check vim version and features
:echo has('python3')        # Verify Python support
:PlugStatus                 # Check plugin status
:CocInfo                    # CoC diagnostic information
:echo $VIMRUNTIME           # Check vim installation path

# Check key mappings
:map <leader>              # See all leader mappings
:verbose map <C-p>         # Check specific mapping source
```

### Getting Help
```vim
# Built-in help system
:help key-mapping          # Key mapping documentation
:help plugin-name          # Plugin-specific help
:help :command             # Command documentation

# CoC-specific help
:CocList                   # Available CoC lists
:CocCommand                # Available CoC commands
```

## 📊 Performance

This configuration is optimized for performance and productivity:

- **⚡ Fast Startup**: Lazy loading with conditional plugin activation
- **🚀 Efficient Redraw**: Optimized drawing settings and large file handling  
- **💾 Smart Caching**: Intelligent completion caching and history management
- **🔍 Quick Search**: FZF integration for near-instant file and content discovery
- **📁 Minimal Memory**: Efficient buffer and undo management
- **🎨 Smooth Scrolling**: Optimized scroll settings and cursor behavior

### Benchmarks
- **Startup Time**: ~150-300ms (depending on system)
- **Large File Handling**: Files up to 100MB with syntax highlighting disabled
- **Search Performance**: Sub-second search in repositories with 10k+ files

## 🤝 Contributing

Contributions are welcome! This configuration evolves with modern Vim practices and user feedback.

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-enhancement`)
3. **Test** thoroughly with different file types and workflows
4. **Document** new features and key mappings
5. **Commit** with clear messages (`git commit -m 'Add enhanced Git integration'`)
6. **Push** to your branch (`git push origin feature/amazing-enhancement`)
7. **Submit** a Pull Request with detailed description

### Guidelines
- **Compatibility**: Test with both Vim 8+ and Neovim
- **Performance**: Ensure changes don't impact startup time significantly
- **Documentation**: Update README for new features and mappings
- **Consistency**: Follow existing code style and organization
- **Testing**: Verify with multiple programming languages

### Areas for Contribution
- **Language Support**: Additional LSP configurations
- **Themes**: Alternative colorscheme options
- **Productivity**: New workflow optimizations
- **Documentation**: Usage examples and tutorials
- **Bug Fixes**: Terminal compatibility and edge cases

## 📜 License

This project is licensed under the [GPL License](LICENSE) - see the LICENSE file for details.

## 🙏 Acknowledgments

### Core Technologies
- **[vim-plug](https://github.com/junegunn/vim-plug)**: Minimalist Vim plugin manager
- **[CoC.nvim](https://github.com/neoclide/coc.nvim)**: Intellisense engine for Vim8 & Neovim
- **[FZF](https://github.com/junegunn/fzf)**: Command-line fuzzy finder

### Essential Plugins
- **[Gruvbox](https://github.com/morhetz/gruvbox)**: Retro groove color scheme
- **[NERDTree](https://github.com/preservim/nerdtree)**: File system explorer
- **[vim-airline](https://github.com/vim-airline/vim-airline)**: Lean & mean status/tabline
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)**: Git wrapper
- **[vim-gitgutter](https://github.com/airblade/vim-gitgutter)**: Git diff in sign column

### Productivity Enhancements  
- **[vim-surround](https://github.com/tpope/vim-surround)**: Quoting/parenthesizing made simple
- **[vim-sneak](https://github.com/justinmk/vim-sneak)**: Jump to any location specified by two characters
- **[undotree](https://github.com/mbbill/undotree)**: Undo history visualizer
- **[indentLine](https://github.com/Yggdroot/indentLine)**: Display indention levels
- **[vim-test](https://github.com/vim-test/vim-test)**: Run tests seamlessly
- **[vim-sleuth](https://github.com/tpope/vim-sleuth)**: Auto-detect indent settings

### Formatting & Language Support
- **[Google](https://github.com/google)**: vim-codefmt, vim-maktaba, vim-glaive
- **[vim-polyglot](https://github.com/sheerun/vim-polyglot)**: Language pack collection

---

**Happy Vimming!** 🎉✨

*This configuration transforms Vim into a modern, powerful development environment while maintaining the elegance and efficiency that makes Vim timeless.*

For advanced techniques and continuous learning:
- **Built-in Help**: `:help user-manual`
- **Vim Tips**: [Vim Tips Wiki](https://vim.fandom.com/wiki/Vim_Tips_Wiki)
- **Modern Vim**: [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
- **Community**: [r/vim](https://reddit.com/r/vim) and [Vim Discord](https://discord.gg/vim)