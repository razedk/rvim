return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    --    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { "<leader>es", "<Cmd>Neotree focus<CR>",      desc = "Give focus to Neotree window" },
      { "<leader>ef", "<Cmd>Neotree filesystem<CR>", desc = "Show filesystem in Neotree window" },
      { "<leader>eb", "<Cmd>Neotree buffers<CR>",    desc = "Show open buffers in Neotree window" },
      { "<leader>eg", "<Cmd>Neotree git_status<CR>", desc = "Show git status in Neotree window" },
      { "<leader>et", "<Cmd>Neotree toggle<CR>",     desc = "Show/hide Neotree window" },
      { "<leader>ee", "<Cmd>Neotree float<CR>",      desc = "Show Neotree in floating window" },
    },
    opts = {
      window = {
        position = "left",
        width = 40, -- set your preferred width here
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "open_current", -- or "open_default"
      },
    },
  },
}
