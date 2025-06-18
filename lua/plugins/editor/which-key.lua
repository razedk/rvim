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
				{ "<leader>a", group = "AI" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>e", group = "Neotree" },
				{ "<leader>f", group = "Files/Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>h", group = "Gitsigns" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>lc", group = "Code actions" },
				{ "<leader>lg", group = "Goto" },
				{ "<leader>li", group = "Inlay hint" },
				{ "<leader>lr", group = "Refactor" },
				{ "<leader>m", group = "Markdown" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>x", group = "Lists (location, quickfix" },
				{ "<leader>s", group = "Search" },
				{ "<leader>u", group = "UI" },
				{ "<leader>p", group = "Project/Session" },
				{ "<leader>z", group = "Plugin" },
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
