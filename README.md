Dotfiles
========

This repository contains my personal dotfiles for Vim and Tmux.

Installation
------------
To install these dotfiles, follow these steps:

1.  Clone this repository to your home directory:

    ```sh
    git clone https://github.com/lohithsrinivasaiah/dotfiles.git ~/.dotfiles
    ```
2.  Navigate to the cloned directory:
    ```sh
    cd ~/.dotfiles
    ````

3.  Run the install script to create symlinks for the dotfiles and back up any existing files:
    ```sh
    ./setup.sh
    ```
    If you make any changes to the dotfiles, you can re-run this script to update the symlinks.

4.  (Optional) If you want to delete the symlinks and restore the backed up dotfiles, run the uninstall script
    ```sh
    ./del.sh
    ```

Vim
---
The Vim configuration is split into several files:

-   `vimrc`: the main configuration file that sets Vim options and loads plugins.
-   `plugins.vim`: a list of plugins to install using the Vim plugin manager `vim-plug`.
-   `remaps.vim`: custom key mappings for Vim.
-   `settings.vim`: additional configuration options and settings.

Tmux
----
The Tmux configuration file is located at `tmux/tmux.conf`.

License
-------
These dotfiles are released under the [MIT License](https://opensource.org/licenses/MIT).
