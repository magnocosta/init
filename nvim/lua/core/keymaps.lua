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

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Formating files
keymap("n", "<leader>cf", "gg=G", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>o", ":on<CR>", opts)
keymap("n", "<leader>a", ":qa!<CR>", opts)

-- Remap L and H
keymap("n", "H", "0", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "0", opts)
keymap("v", "L", "$", opts)

-- Save the copy context
keymap("x", "<leader>p", "\"_dP", opts)

-- Close all buffers
keymap("n", "<leader>bq", "<cmd>:%bd|e#<cr>", opts)

-- Remap tabs
keymap("n", "<leader>t", "<cmd>tabnew<cr>", opts)
keymap("n", "]t", "<cmd>tabnext<cr>", opts)
keymap("n", "[t", "<cmd>tabprevious<cr>", opts)

-- Nvim Tree
keymap("n", "<c-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<c-f>", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fv", "<cmd>Telescope git_branches<cr>", opts)

-- Fugitive
keymap("n", "<leader>gd", "<cmd>:Gvdiffsplit<cr>", opts)
keymap("n", "<leader>gs", "<cmd>:Git<cr>", opts)
keymap("n", "<leader>gb", "<cmd>:Git blame<cr>", opts)
keymap("n", "<leader>gc", "<cmd>:Git commit<cr>", opts)
keymap("n", "<leader>ge", "<cmd>:Gedit<cr>", opts)
keymap("n", "<leader>gr", "<cmd>:Gread<cr>", opts)
keymap("n", "<leader>gp", "<cmd>:G push<cr>", opts)
keymap("n", "<leader>go", "<cmd>:G pull<cr>", opts)
keymap("n", "<leader>gl", "<cmd>:0Gclog<cr>", opts)

keymap("n", "<leader>gh", "<cmd>:diffget //2<cr>", opts)
keymap("n", "<leader>gu", "<cmd>:diffget //3<cr>", opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
