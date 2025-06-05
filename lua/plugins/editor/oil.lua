return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "icon",
      "size",
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<Esc>"] = { "actions.close", mode = "n" },
    },
  },  dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<Cmd>Oil --float<CR>", desc = "Open parent directory" },
		},
}
