return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts_extend = { "spec" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>f", group = "Files/Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>t", group = "Neotree" },
				{ "<leader>x", group = "Lists (location, quickfix" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
		--{
		--	"<c-w><space>",
		--	function()
		--		require("which-key").show({ keys = "<c-w>", loop = true })
		--	end,
		--	desc = "Window Hydra Mode (which-key)",
		--},
	},
}
