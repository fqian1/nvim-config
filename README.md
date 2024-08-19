# My Neovim Configuration

This repository contains my personal Neovim configuration files and plugins.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Features](#features)
- [Key Mappings](#key-mappings)
- [Plugins](#plugins)
- [Custom Functions](#custom-functions)
- [Colorscheme](#colorscheme)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- Neovim (version X.X or higher)
- [Optional] Any additional dependencies (e.g., specific language servers, external tools)

## Installation

1. Backup your existing Neovim configuration:
   ```
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```
   git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim
   ```

## Features

- List key features of your Neovim configuration
- e.g., Fuzzy finding, LSP integration, Git integration

## Key Mappings

Describe your custom key mappings here. For example:

- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>fe`: Toggle file explorer

Telescope mappings (Normal mode):
- ["g"] = Goto parent directory
- ["e"] = Go to home directory
- ["J"] = Scroll preview down
- ["K"] = Scroll preview up
- ["o"] = Open in file explorer
- ["w"] = Goto CWD
- ["h"] = Toggle hidden folders

- ["c"] = Create file/folder
- ["y"] = Copy file
- ["m"] = Move
- ["r"] = Rename
- ["d"] = Remove
- ["x"] = Open with horizontal split
- ["v"] = Open with vertical split
- ["t"] = Open in new tab

## Plugins

Plugin manager: Lazy.nvim
Fuzzy finder: Telescope.nvim
Syntax highligher: Treesitter.nvim
Completion:
LSP:
DAP:
Linter:
Undo tree:
Auto brackets:
Surround:
Git signs:
Indent lines:
Tokyonight:

## Custom Functions

If you have any custom Lua or Vimscript functions, briefly describe them here.

## Colorscheme

tokyonight
