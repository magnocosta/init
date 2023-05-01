local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- Remap tabs
keymap("n", "t]", "<cmd>tabnext<cr>", opts)
keymap("n", "t[", "<cmd>tabprevious<cr>", opts)
keymap("n", "tn", "<cmd>tabnew<cr>", opts)

-- Nvim Tree
keymap("n", "<c-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<c-m>", ":NvimTreeFocus<CR>", opts)
keymap("n", "<c-f>", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Space>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Space>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<Space>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<Space>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<Space>fp", "<cmd>Telescope projects<cr>", opts)

keymap("n", "<Space>gd", "<cmd>:Gvdiffsplit<cr>", opts)
keymap("n", "<Space>gs", "<cmd>:Git<cr>", opts)
keymap("n", "<Space>gb", "<cmd>:Git blame<cr>", opts)
keymap("n", "<Space>gc", "<cmd>:Git commit<cr>", opts)
keymap("n", "<Space>ge", "<cmd>:Gedit<cr>", opts)
keymap("n", "<Space>gr", "<cmd>:Gread<cr>", opts)
keymap("n", "<Space>gp", "<cmd>:G push<cr>", opts)
keymap("n", "<Space>gl", "<cmd>:0Gclog<cr>", opts)
