# 🚀 My Neovim Configuration

A powerful and modern Neovim setup focused on productivity, aesthetics, and seamless development experience.

## 📦 Plugin Manager

| Plugin | Description |
|--------|-------------|
| 📦 [packer.nvim](https://github.com/wbthomason/packer.nvim) | Use-package inspired plugin manager for Neovim |

## ✨ Basic Editor Features

| Plugin | Description |
|--------|-------------|
| 🔗 [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets, quotes, and other pairs |
| 🌟 [alpha-nvim](https://github.com/goolord/alpha-nvim) | Fast and customizable greeter/start screen |
| 💬 [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart and powerful commenting plugin |
| ⚡ [impatient.nvim](https://github.com/lewis6991/impatient.nvim) | Speed up Neovim startup time |
| 📁 [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) | File type icons for Neovim plugins |
| 🔀 [vim-fugitive](https://github.com/tpope/vim-fugitive) | Premier Git plugin for Vim/Neovim |
| ⬆️ [vim-unimpaired](https://github.com/tpope/vim-unimpaired) | Handy bracket mappings for common operations |
| 🔄 [vim-surround](https://github.com/tpope/vim-surround) | Quoting/parenthesizing made simple |
| 📏 [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides for Neovim |
| 🖥️ [nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation) | Seamless navigation between tmux panes and Neovim splits |
| 📝 [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Enhanced markdown rendering in Neovim |

## 🎨 Theme & UI

| Plugin | Description |
|--------|-------------|
| 🧛 [dracula.nvim](https://github.com/Mofiqul/dracula.nvim) | Dark theme for Neovim |
| 📊 [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Blazing fast and easy to configure statusline |
| 🌳 [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer tree for Neovim |

## 🔍 Fuzzy Finding & Search

| Plugin | Description |
|--------|-------------|
| 🔭 [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Highly extendable fuzzy finder over lists |
| 🔗 [telescope-lsp-handlers.nvim](https://github.com/Slotos/telescope-lsp-handlers.nvim) | LSP handlers for Telescope |
| 🛠️ [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Utility functions for Neovim plugins |

## 🌳 Syntax & Parsing

| Plugin | Description |
|--------|-------------|
| 🌲 [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Treesitter configurations and abstraction layer |

## 💡 Completion & LSP

| Plugin | Description |
|--------|-------------|
| 🧠 [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine for Neovim |
| 📄 [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer completion source for nvim-cmp |
| 📁 [cmp-path](https://github.com/hrsh7th/cmp-path) | Path completion source for nvim-cmp |
| 🔧 [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source for nvim-cmp |
| 🌙 [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) | Lua completion source for nvim-cmp |
| ⌨️ [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) | Command line completion source for nvim-cmp |
| ✍️ [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) | Function signature help for nvim-cmp |
| 🛠️ [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Quickstart configurations for the Neovim LSP client |
| 📝 [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine for Neovim |
| 🎨 [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | VSCode-like pictograms for completion menu |
| 🔗 [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | LuaSnip completion source for nvim-cmp |
| 🔧 [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) | Use external tools as LSP sources |

## 🤖 AI Assistance

| Plugin | Description |
|--------|-------------|
| 🐙 [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot plugin for Neovim |
| 🤖 [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) | AI-powered coding assistant |

## 📝 Language-Specific

| Plugin | Description |
|--------|-------------|
| 🏗️ [vim-terraform](https://github.com/hashivim/vim-terraform) | Syntax highlighting and more for Terraform |
| 🎯 [dart-vim-plugin](https://github.com/dart-lang/dart-vim-plugin) | Syntax highlighting for Dart language |

## 📁 Configuration Structure

```
nvim/
├── init.lua                 # Main configuration entry point
├── lua/core/               # Core configuration modules
│   ├── options.lua         # Neovim options and settings
│   ├── plugins.lua         # Plugin definitions and setup
│   ├── colorscheme.lua     # Color scheme configuration
│   ├── keymaps.lua         # Custom key mappings
│   └── ...                 # Individual plugin configurations
├── snippets/               # Custom snippets
│   └── javascript.snippets # JavaScript snippets
└── plugin/                 # Compiled plugin cache
    └── packer_compiled.lua # Packer compiled configuration
```

## 🚀 Features

- ⚡ **Fast Startup**: Optimized with impatient.nvim
- 🎨 **Beautiful UI**: Dracula theme with lualine statusline
- 🧠 **Smart Completion**: Comprehensive completion with nvim-cmp
- 🔍 **Powerful Search**: Telescope for fuzzy finding
- 🤖 **AI Integration**: GitHub Copilot and CodeCompanion
- 🌳 **Modern Syntax**: Treesitter for better highlighting
- 🔧 **LSP Support**: Full Language Server Protocol integration
- 📦 **Easy Management**: Packer for plugin management

## 💫 Getting Started

1. Ensure you have Neovim 0.8+ installed
2. Clone this configuration to your Neovim config directory
3. Run `:PackerInstall` to install all plugins
4. Restart Neovim and enjoy!

---

*Happy coding! 🎉*