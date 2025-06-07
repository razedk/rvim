return {
  -- This is what powers LazyVim's fancy-looking
  -- tabs, which include filetype icons and close buttons.
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete Other Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
      { "<leader>bb", "<cmd>e #<cr>",                            desc = "Switch to Other Buffer" },
      --			{ "<leader>bd", "<cmd>bd<cr>", desc = "Delete Buffer" },
      { "<leader>bD", "<cmd>bw<cr>",                             desc = "Delete Buffer and Window" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "<S-tab>",    "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "<tab>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "<leader>bM", "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
      { "<leader>bm", "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
}
