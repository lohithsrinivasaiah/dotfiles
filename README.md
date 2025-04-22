# Dotfiles

Repository to manage configurations for Vim, Tmux, and a custom Tmux session command.

## Installation

To set up these dotfiles, follow these steps:

1. Clone this repository to your home directory:
    ```sh
    git clone https://github.com/lohithsrinivasaiah/dotfiles.git ~/.dotfiles
    ```

2. Navigate to the cloned directory:
    ```sh
    cd ~/.dotfiles
    ```

3. Run the installation script to create symlinks for the dotfiles and back up any existing files:
    ```sh
    ./install.sh
    ```
    If you make changes to the dotfiles, rerun this script to update the symlinks.

4. (Optional) To delete the symlinks and restore the backed-up dotfiles, run the uninstall script:
    ```sh
    ./uninstall.sh
    ```

## Vim Configuration

The Vim configuration is organized into several files:

- `vimrc`: the primary configuration file setting Vim options and loading plugins.
- `plugins.vim`: a list of plugins to install using the Vim plugin manager `vim-plug`.
- `remaps.vim`: custom key mappings for Vim.
- `settings.vim`: additional configuration options and settings.

## Tmux Configuration

The Tmux configuration file is located at `tmux/tmux.conf`.

## Session Command

This repository includes a custom shell command called `session` for simplified Tmux session management.

### Usage

Use the `session` command to create and manage Tmux sessions effortlessly:
```sh
session <session_name>

