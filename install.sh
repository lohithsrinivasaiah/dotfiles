#!/bin/bash
# Minimal install: Only create symlinks, plus Vim and Node.js feature checks
set -e

# Ensure parent directories exist for all symlinks
mkdir -p "$HOME/.vim" "$HOME/.vim/plugged" "$HOME/.vim/autoload" "$HOME/.config" "$HOME/.tmux" "$HOME/.bash" 2>/dev/null || true

# Ensure source files exist (create empty if missing)
touch "$PWD/vim/vimrc" "$PWD/vim/plugins.vim" "$PWD/vim/remaps.vim" "$PWD/vim/settings.vim" "$PWD/tmux/tmux.conf" "$PWD/bash/alias.sh"

echo "Creating symlinks..."
ln -sfv "$PWD/vim/vimrc" "$HOME/.vimrc"
ln -sfv "$PWD/vim/plugins.vim" "$HOME/.vim/plugins.vim"
ln -sfv "$PWD/vim/remaps.vim" "$HOME/.vim/remaps.vim"
ln -sfv "$PWD/vim/settings.vim" "$HOME/.vim/settings.vim"
ln -sfv "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sfv "$PWD/bash/alias.sh" "$HOME/.bash_aliases"

echo
# Check for Vim +python3 and +clipboard support
echo "Checking Vim features..."
VIM_VERSION=$(vim --version 2>/dev/null)
if ! echo "$VIM_VERSION" | grep -q "+python3"; then
  echo "[!] Your Vim is missing +python3 support. Some plugins (like coc.nvim) require it."
  echo "    See: https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#requirements"
  echo "    To install Vim with +python3: https://github.com/vim/vim-win32-installer#installing, or use your package manager:"
  echo "      Ubuntu: sudo apt install vim-nox   (or vim-gtk3 or vim-athena)"
  echo "      MacOS:  brew install vim"
fi
if ! echo "$VIM_VERSION" | grep -q "+clipboard"; then
  echo "[!] Your Vim is missing +clipboard support. System clipboard integration will not work."
  echo "    See: https://github.com/chriscool/vim-config/blob/master/doc/clipboard.md"
  echo "    To install Vim with +clipboard: https://github.com/vim/vim-win32-installer#installing, or use your package manager:"
  echo "      Ubuntu: sudo apt install vim-gtk3"
  echo "      MacOS:  brew install vim"
fi

echo
# Check for Node.js (required for coc.nvim)
echo "Checking Node.js for coc.nvim..."
if ! command -v node >/dev/null 2>&1; then
  echo "[!] Node.js is not installed or not in your PATH. coc.nvim will NOT work."
  echo "    Download Node.js from: https://nodejs.org/en/download/"
  echo "    Or install with your package manager:"
  echo "      Ubuntu: sudo apt install nodejs npm"
  echo "      Arch:   sudo pacman -S nodejs npm"
  echo "      MacOS:  brew install node"
fi
echo

echo "Done creating symlinks!"
