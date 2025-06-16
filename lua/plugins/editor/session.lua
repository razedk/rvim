return {
	{
		"rmagatti/auto-session",
		lazy = false,
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ "<leader>sr", "<cmd>SessionSearch<CR>", desc = "Session search" },
			{ "<leader>ss", "<cmd>SessionSave<CR>", desc = "Save session" },
			{ "<leader>sa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
		},
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				load_on_setup = true, -- Initialize on startup (requires Telescope)
				picker_opts = nil, -- Table passed to Telescope / Snacks to configure the picker. See below for more information
				mappings = {
					-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
					delete_session = nil,
					alternate_session = nil,
					copy_session = nil,
				},
			},
		},
	},
}
