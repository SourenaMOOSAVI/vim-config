# Vim Configuration

A comprehensive, modern Vim configuration designed for enhanced productivity with professional-grade plugins, intuitive key mappings, and robust language support. This setup provides a powerful development environment with LSP integration, intelligent code formatting, and a clean, efficient interface optimized for Python and C++ development.

## ✨ Key Features

### Core Functionality
- **🔢 Hybrid Line Numbers**: Combines absolute and relative numbering for optimal navigation
- **📋 System Clipboard Integration**: Seamless copy/paste with system clipboard (`+` register)
- **🖱️ Full Mouse Support**: Complete mouse interaction for modern workflows
- **💾 Persistent Undo**: Maintains undo history across sessions in `~/.vim/undodir`
- **🎨 True Color Support**: Vibrant colors with `termguicolors` enabled
- **🚀 Performance Optimized**: Fast redraw with `lazyredraw` and optimized settings

### Language Support & Formatting
- **📝 Intelligent Indentation**: 4-space default, 2-space for C/C++, with smart auto-indent
- **🔧 Advanced Code Formatting**: Google's vim-codefmt for reliable, consistent formatting
- **🎯 Language-Specific Settings**: Tailored configurations for Python and C++
- **🛠️ LSP Integration**: Full Language Server Protocol support via CoC.nvim

### Plugin Ecosystem
- **🧠 CoC.nvim**: Advanced LSP with autocompletion for Python, C++, JSON, and more
- **📁 NERDTree**: Intuitive file explorer with hidden file support
- **🔍 FZF**: Lightning-fast fuzzy file and content searching
- **✈️ vim-airline**: Beautiful statusline with Git integration and buffer tabs
- **🎨 Gruvbox Theme**: Professional, high-contrast colorscheme
- **🌈 vim-polyglot**: Superior syntax highlighting for 600+ languages
- **💬 Smart Commenting**: Intelligent commenting with vim-commentary
- **🔗 Auto-pairs**: Automatic bracket/quote pairing and completion

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

# Optional but recommended
fzf  # For fuzzy finding
ripgrep  # For content search
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

5. **Install CoC extensions**
   ```vim
   # Inside Vim:
   :CocInstall coc-clangd coc-pyright coc-json coc-snippets
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

#### File & Buffer Management
| Key | Action | Description |
|-----|---------|-------------|
| `<C-n>` | Toggle NERDTree | Open/close file explorer |
| `<C-p>` | Files | FZF file search |
| `<leader>b` | Buffers | List open buffers |
| `<leader>rg` | Ripgrep | Search file contents |
| `<leader>bn/bp` | Buffer Next/Previous | Navigate buffers |
| `<leader>bd` | Buffer Delete | Close current buffer |

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
| `[g` / `]g` | Diagnostics | Previous/next diagnostic |
| `<leader>d` | Diagnostics List | Show all diagnostics |

#### Code Formatting & Editing
| Key | Action | Description |
|-----|---------|-------------|
| `<leader>f` | Format Code | Format current buffer |
| `<leader>/` | Comment Toggle | Comment/uncomment lines |
| `<leader>h` | Clear Highlight | Clear search highlights |
| `<leader>r` | Redraw | Fix phantom characters |

#### Window Navigation
| Key | Action | Description |
|-----|---------|-------------|
| `<C-h/j/k/l>` | Window Move | Navigate between splits |

#### Autocompletion
| Key | Action | Description |
|-----|---------|-------------|
| `<TAB>` | Next Completion | Navigate completion menu |
| `<S-TAB>` | Previous Completion | Navigate backwards |
| `<CR>` | Accept Completion | Confirm selection |

### Advanced Features

#### Code Formatting
This configuration uses Google's vim-codefmt for superior formatting:

```vim
# Format entire buffer
<leader>f

# Format selected lines (visual mode)
<leader>f

# Auto-format on save (optional, disabled by default)
# Uncomment lines in the .vimrc to enable
```

#### C++ Specific Commands
```vim
# Fix C++ brace formatting manually
:FixCppFormat

# This transforms:
void func() { code; }
# Into:
void func() {
  code;
}
```

#### Phantom Character Fix
If you see random characters that disappear when you move the cursor:
- Press `<leader>r` to redraw the screen
- The configuration includes multiple fixes for this common terminal issue

### File Explorer (NERDTree)
- **Toggle**: `<C-n>`
- **Features**: Shows hidden files, auto-closes on file open
- **Navigation**: Use standard vim keys (`j/k` to move, `<CR>` to open)

### Fuzzy Finding (FZF)
- **Files**: `<C-p>` - Find and open files
- **Buffers**: `<leader>b` - Switch between open buffers  
- **Content**: `<leader>rg` - Search inside files (requires ripgrep)

## 🔧 Customization

### Adding New Languages
```vim
# Add to the CoC extensions list
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright', 'coc-json', 'coc-snippets', 'coc-rust-analyzer']

# Add language-specific settings
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab
```

### Changing Colorscheme
```vim
# Replace in .vimrc
colorscheme gruvbox
# With your preferred theme, e.g.:
colorscheme monokai
```

### Custom Key Mappings
```vim
# Add to .vimrc
nnoremap <leader>t :terminal<CR>    " Open terminal
nnoremap <F5> :w<CR>:!python %<CR>  " Run Python file
```

### Plugin Management
```vim
# Add new plugins between plug#begin() and plug#end()
Plug 'tpope/vim-surround'          " Text object manipulation

# Then run:
:PlugInstall
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

# Update plugins
vim +PlugUpdate +qall
```

#### LSP/CoC Not Working
```vim
# Check CoC status
:CocInfo

# Check installed extensions
:CocList extensions

# Reinstall extensions
:CocInstall coc-clangd coc-pyright coc-json coc-snippets
```

#### Formatting Not Working
```bash
# Verify formatters are installed
which clang-format black autopep8

# Check if they're in PATH
echo $PATH

# Install missing formatters
pip install black autopep8 isort
```

#### Phantom Characters
- Press `<leader>r` to redraw screen
- Check terminal compatibility with `set termguicolors`
- Try disabling problematic terminal features in .vimrc

#### Icons Not Showing (NERDTree)
1. Install a [Nerd Font](https://www.nerdfonts.com/font-downloads)
2. Set it as your terminal font
3. Restart terminal and vim

### Debug Mode
```vim
# Check vim version and features
:version

# Check if Python support is available
:echo has('python3')

# View loaded plugins
:PlugStatus

# Check CoC logs
:CocOpenLog
```

## 📊 Performance

This configuration is optimized for performance:
- **Lazy loading**: Plugins load only when needed
- **Fast redraw**: Optimized drawing settings
- **Minimal startup**: Essential plugins only
- **Efficient search**: FZF integration for fast file finding

## 🤝 Contributing

Contributions are welcome! Please:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Test** your changes thoroughly
4. **Commit** your changes (`git commit -m 'Add amazing feature'`)
5. **Push** to the branch (`git push origin feature/amazing-feature`)
6. **Open** a Pull Request

### Guidelines
- Keep changes focused and atomic
- Test with both Vim and Neovim if possible
- Update documentation for new features
- Follow existing code style

## 📜 License

This project is licensed under the [GNU General Public License v3.0](LICENSE) - see the LICENSE file for details.

## 🙏 Acknowledgments

- **vim-plug**: Minimalist Vim plugin manager
- **CoC.nvim**: Intellisense engine for Vim8 & Neovim
- **Google**: vim-codefmt and formatting tools
- **junegunn**: FZF and vim-plug
- **Gruvbox**: Beautiful retro groove color scheme

---

**Happy Vimming!** 🎉

For more advanced Vim techniques, check out `:help` within Vim or visit [Vim's official documentation](https://www.vim.org/docs.php).