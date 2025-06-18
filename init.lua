-- Basic nvim configuration
require("config.options")
require("config.basic-keymaps")
require("config.features")

-- Get and setup lazy package manager
require("config.lazy")

-- Set color scheme
vim.cmd("colorscheme tokyonight-night")

local windowSeparatorColor = "#392c75"
vim.cmd("hi WinSeparator guifg=" .. windowSeparatorColor)
