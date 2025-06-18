vim.g.mapleader = " "

---@diagnostic disable:missing-fields
local map = vim.keymap.set -- for conciseness

-- ################################################################################################################### --
-- Neovim general key bindings - these are all keybindings that are unrelated to any plugins
-- ################################################################################################################### --

-- Alternative ways to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
map("n", "<A-DOWN>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-UP>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-DOWN>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-UP>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-DOWN>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-UP>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Clear search highlights
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number (C-a)" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number (C-x)" }) -- decrement

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Lazy/Mason
map("n", "<leader>zl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>zm", "<cmd>Mason<cr>", { desc = "Mason" })

map("n", "<C-q>", ":q<CR>", { desc = "Quit current window/buffer" })
--map("n", "<C-e>", ":qa<CR>", { desc = "Quit all windows/buffers" })

-- Special hacks for insert mode to make it slightly more similar to a tradional editor
map("i", "<C-Left>", "<C-o>b", { desc = "Jump to beginning of previous word" })
map("i", "<C-Right>", "<C-o>w", { desc = "Jump to beginning of next word" })
map("i", "<A-Left>", "<C-o>b", { desc = "Jump to beginning of previous word" })
map("i", "<A-Right>", "<C-o>w", { desc = "Jump to beginning of next word" })

-- Lower/uppercase current word
map("i", "<C-u>", "<C-o>g~iw", { desc = "Toggle case on current word" })
map("i", "<A-u>", "<C-o>guiw", { desc = "Lowercase on current word" })
map("i", "<A-S-u>", "<C-o>gUiw", { desc = "Uppercase on current word" })

-- Delete current line
map("i", "<C-d>", "<C-o>dd", { desc = "Delete current line" })

-- Buffer commands
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>bw<cr>", { desc = "Delete Buffer and Window" })

-- Select
map("i", "<S-Right>", "<ESC>lve", { desc = "Select from cursor to end of word" })
map("i", "<S-Left>", "<ESC>vb", { desc = "Select from cursor to beginning of word" })
map("i", "<A-S-Left>", "<ESC>V", { desc = "Select whole line" })
map("i", "<A-S-Right>", "<ESC>V", { desc = "Select whole line" })

-- Select all
map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all in file/buffer" })
--map("n", "<C-a>", "ggVG", { desc = "Select all in file/buffer" })

-- Folding
map("n", "z0", ":set foldlevel=0<CR>", { desc = "Collapse all folds" })
map("n", "z1", ":set foldlevel=1<CR>", { desc = "Collapse to level 1" })
map("n", "z2", ":set foldlevel=2<CR>", { desc = "Collapse to level 2" })
map("n", "z3", ":set foldlevel=3<CR>", { desc = "Collapse to level 3" })
map("n", "z4", ":set foldlevel=4<CR>", { desc = "Collapse to level 4" })
map("n", "z5", ":set foldlevel=5<CR>", { desc = "Collapse to level 5" })
map("n", "z6", ":set foldlevel=6<CR>", { desc = "Collapse to level 6" })
map("n", "z7", ":set foldlevel=7<CR>", { desc = "Collapse to level 7" })
map("n", "z8", ":set foldlevel=8<CR>", { desc = "Collapse to level 8" })
map("n", "z9", ":set foldlevel=99<CR>", { desc = "Open all folds" })

-- Terminal
--map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
map("t", "jk", [[<C-\><C-n>]], { noremap = true })
