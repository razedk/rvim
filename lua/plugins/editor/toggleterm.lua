return {
  'akinsho/toggleterm.nvim',
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<CR>",            desc = "Toggle Terminal" },
    { "<leader>tt", "<C-\\><C-n><cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
  },
  opts = {
    open_mapping = [[<C-t>]], -- Ctrl-t to toggle
    direction = "float",      -- Float, vertical, horizontal, or tab
    float_opts = {
      border = "curved",      -- Or: "single", "double", "shadow", etc.
    },
    start_in_insert = true,
  }
}
