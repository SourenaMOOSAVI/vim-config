# Vim Configuration

This repository contains my personal `.vimrc` configuration for Vim, designed to enhance productivity with modern plugins, intuitive key mappings, and a clean, efficient setup. It supports general programming with a focus on Python and C++ development, featuring LSP integration, syntax highlighting, and a sleek interface.

## Features

- **Hybrid Line Numbers**: Combines absolute and relative line numbers for easy navigation.
- **Consistent Indentation**: Configures 4-space tabs for general use, with 2-space tabs for C++.
- **System Clipboard Integration**: Seamlessly copy/paste to/from the system clipboard.
- **Mouse Support**: Enables mouse interaction for scrolling and selecting.
- **Persistent Undo**: Saves undo history across sessions in `~/.vim/undodir`.
- **Plugin Ecosystem**:
  - **CoC.nvim**: Language server protocol (LSP) support with autocompletion for Python, C++, and more.
  - **NERDTree**: File explorer for easy navigation.
  - **FZF**: Fuzzy file and content search.
  - **vim-airline**: Customizable statusline with Git integration.
  - **ALE**: Asynchronous linting and formatting for Python and C++.
  - **Gruvbox**: Modern, high-contrast colorscheme with true color support.
  - **vim-polyglot**: Enhanced syntax highlighting for multiple languages.
- **Custom Key Mappings**: Space as the leader key with intuitive shortcuts for navigation, commenting, and LSP actions.
- **Auto-formatting**: Automatically formats Python and C++ code on save using ALE.

## Prerequisites

- **Vim**: Version 8.0 or higher (Neovim is also compatible).
- **Git**: For cloning the repository and installing plugins.
- **Node.js**: Required for CoC.nvim (LSP and autocompletion).
- **Python**: For Python linting and formatting (e.g., `flake8`, `pylint`, `black`, `isort`).
- **C++ Compiler**: For C++ linting (e.g., `clang-tidy`, `clang-format`).
- **FZF**: For fuzzy finding functionality (install via package manager or included script).

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```

2. **Link the `.vimrc` File**
   ```bash
   ln -s ~/dotfiles/.vimrc ~/.vimrc
   ```

3. **Install vim-plug (Plugin Manager)**
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. **Install Plugins**
   - Open Vim and run:
     ```vim
     :PlugInstall
     ```
   - This installs all plugins listed in the `.vimrc`.

5. **Install Dependencies for CoC.nvim**
   - Ensure Node.js is installed.
   - Install CoC extensions:
     ```vim
     :CocInstall coc-clangd coc-pyright coc-json coc-snippets
     ```

6. **Install Linters and Formatters**
   - For Python:
     ```bash
     pip install flake8 pylint black isort
     ```
   - For C++:
     - Ensure `clang-tidy` and `clang-format` are installed (e.g., via `apt`, `brew`, or package manager).

## Usage

### Key Mappings

- **Leader Key**: `<Space>`
- **General**:
  - `<C-n>`: Toggle NERDTree file explorer.
  - `<C-p>`: Open FZF to search files.
  - `<leader>b`: List open buffers.
  - `<leader>rg`: Search file contents with Ripgrep (via FZF).
  - `<leader>h`: Clear search highlights.
  - `<leader>/`: Comment/uncomment line(s).
  - `<leader>bn`, `<leader>bp`: Navigate to next/previous buffer.
  - `<leader>bd`: Delete current buffer.
  - `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: Navigate between windows.
- **LSP (CoC.nvim)**:
  - `K`: Show hover documentation.
  - `gd`: Go to definition.
  - `gy`: Go to type definition.
  - `gi`: Go to implementation.
  - `gr`: Show references.
  - `<leader>rn`: Rename symbol.
  - `<leader>ca`: Apply code actions.
  - `<leader>f`: Format code.
  - `[g`, `]g`: Navigate to previous/next diagnostic.
  - `<leader>d`: Show diagnostics in a floating window.
- **Autocompletion**:
  - `<TAB>`: Trigger completion or navigate to next suggestion.
  - `<S-TAB>`: Navigate to previous suggestion.
  - `<CR>`: Confirm completion.

### Useful Commands

- `:Files`: Search and open files with FZF.
- `:Buffers`: List and switch between open buffers.
- `:Rg`: Search file contents using Ripgrep.
- `:NERDTreeToggle`: Open/close the file explorer.
- `:CocList diagnostics`: View all diagnostics.
- `:PlugInstall`: Install plugins.
- `:PlugUpdate`: Update plugins.
- `:PlugClean`: Remove unused plugins.

### File Explorer (NERDTree)
- Shows hidden files by default.
- Closes automatically when a file is opened.
- Press `<C-n>` to toggle.

### Statusline (vim-airline)
- Displays Git branch, file information, and LSP status.
- Uses the Gruvbox theme with powerline fonts.

### Linting and Formatting (ALE)
- Automatically lints and formats Python and C++ files on save.
- Python: Uses `flake8` and `pylint` for linting, `black` and `isort` for formatting.
- C++: Uses `clang-tidy` for linting, `clang-format` for formatting.

## Customization

- **Change Colorscheme**: Modify `colorscheme gruvbox` to another installed scheme (e.g., replace with `desert`).
- **Adjust Indentation**: Change `tabstop` and `shiftwidth` in the `.vimrc` or filetype-specific settings.
- **Add Plugins**: Add new `Plug` entries in the `plug#begin`/`plug#end` section and run `:PlugInstall`.
- **Modify Key Mappings**: Edit the `nnoremap`, `inoremap`, or `vmap` commands to customize shortcuts.

## Troubleshooting

- **Plugins Not Loading**: Ensure `vim-plug` is installed and run `:PlugInstall`.
- **LSP Not Working**: Verify Node.js is installed and CoC extensions are loaded (`:CocList extensions`).
- **Formatting Issues**: Check that `black`, `isort`, `clang-format`, and `clang-tidy` are installed and in your PATH.
- **NERDTree Icons Missing**: Install a [patched Nerd Font](https://www.nerdfonts.com/) and set it in your terminal.

## Contributing

Feel free to fork this repository, make changes, and submit pull requests. Suggestions for improving the `.vimrc` are welcome!

## License

This configuration is released under the [MIT License](LICENSE).