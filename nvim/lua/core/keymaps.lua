local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Remap L and H
keymap("n", "H", "0", opts)
keymap("n", "L", "$", opts)

-- Close all buffers
keymap("n", "bq", "<cmd>:%bd|e#<cr>", opts)

-- Remap tabs
keymap("n", "t", "<cmd>tabnew<cr>", opts)

-- Nvim Tree
keymap("n", "<c-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<c-f>", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "fv", "<cmd>Telescope git_branches<cr>", opts)

-- Fugitive
keymap("n", "gd", "<cmd>:Gvdiffsplit<cr>", opts)
keymap("n", "gs", "<cmd>:Git<cr>", opts)
keymap("n", "gb", "<cmd>:Git blame<cr>", opts)
keymap("n", "gc", "<cmd>:Git commit<cr>", opts)
keymap("n", "ge", "<cmd>:Gedit<cr>", opts)
keymap("n", "gr", "<cmd>:Gread<cr>", opts)
keymap("n", "gp", "<cmd>:G push<cr>", opts)
keymap("n", "gl", "<cmd>:0Gclog<cr>", opts)
