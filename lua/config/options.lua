local opt = vim.opt -- Vim options
--local g = vim.g -- Vim global variables

-- Line numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.softtabstop = 2 -- 2 spaces when pressing tab instead of a tab
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- Disable wrap of text

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- mixed case in search assumes you want case-sensitive

opt.cursorline = true -- Current line is highlighted
opt.mouse = "a" -- Enable mouse support in all modes

opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.termguicolors = true -- true color support
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- saving
opt.undofile = true -- Save undoes to a file allowing undo after a restart
opt.autowrite = true -- Automatically saves buffer when switching to another buffer
opt.confirm = true -- Confirm to save changes before exiting buffer

-- Updating requences
vim.o.updatetime = 2000

-- Disable netrw, we want to use neotree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
