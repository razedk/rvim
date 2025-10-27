-- Custom action to send selected items to a new buffer
local function CustomSnackSendItemsToNewBuffer(picker, items)
	-- Get all items (or selected items if any are selected)
	local results = #items > 0 and items or picker:items()

	-- Create new buffer
	-- local buf = vim.api.nvim_create_buf(true, true) -- (listed=true, scratch=true)
	local buf = vim.api.nvim_create_buf(true, false) -- (listed=true, scratch=true)
	vim.api.nvim_set_current_buf(buf)

	-- Extract text from items
	local lines = {}
	for _, item in ipairs(results) do
		-- item.text contains the display text
		-- item.file, item.lnum, item.col for location info
		if item.text then
			table.insert(lines, item.text)
		end
	end

	-- Set lines in buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].buftype = "nofile"
	-- vim.bo[buf].bufhidden = "wipe"
	vim.schedule(function()
		vim.cmd("only")
	end)
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
  -- stylua: ignore start
  keys = {
    { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    -- { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
    -- find
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gsd",             function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gsD",             function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gsr",             function() Snacks.picker.lsp_references() end,                          desc = "References", nowait = true },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
  },
	-- stylua: ignore end

	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = true, only_current = true, animate = { enabled = false } },
		input = { enabled = true },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		picker = {
			enabled = true,
			matcher = {
				fuzzy = false, -- Disable fuzzy matching globally
			},
			win = {
				input = {
					keys = {
						["<C-x>"] = { "send_items_to_new_buffer", mode = { "n", "i" } },
					},
				},
			},
			actions = {
				send_items_to_new_buffer = CustomSnackSendItemsToNewBuffer,
			},
		},
	},
}
