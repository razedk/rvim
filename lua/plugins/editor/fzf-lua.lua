return {
  "ibhagwan/fzf-lua",
		event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fh", function() require("fzf-lua").helptags() end,  desc = "[F]ind [H]elp" },
    { "<leader>fk", function() require("fzf-lua").keymaps() end,  desc = "[F]ind [K]eymaps" },
    { "<leader>ff", function() require("fzf-lua").files() end,  desc = "[F]ind [F]iles" },
    { "<leader>fp", "<cmd>FzfDirectories<CR>",  desc = "[F]ind [P]aths" },
    { "<leader>fb", function() require("fzf-lua").builtin() end,  desc = "[F]ind [B]uiltin FZF" },
    { "<leader>fw", function() require("fzf-lua").grep_cword() end,  desc = "[F]ind current [W]ord" },
    { "<leader>fW", function() require("fzf-lua").grep_cWORD() end,  desc = "[F]ind current [W]ORD" },
    { "<leader>fG", function() require("fzf-lua").live_grep() end,  desc = "[F]ind by Live [G]rep" },
    { "<leader>fg", function() require("fzf-lua").grep_project() end,  desc = "[F]ind by [G]rep" },
    { "<leader>fd", function() require("fzf-lua").diagnostics_document() end,  desc = "[F]ind [D]iagnostics" },
    { "<leader>fr", function() require("fzf-lua").resume() end,  desc = "[F]ind [R]esume" },
    { "<leader>fo", function() require("fzf-lua").oldfiles() end,  desc = "[F]ind [O]ld Files" },
    { "<leader><leader>", function() require("fzf-lua").buffers() end,  desc = "[,] Find existing buffers" },
    { "<leader>/", function() require("fzf-lua").lgrep_curbuf() end,  desc = "[/] Live grep the current buffer" },
    { "<leader>fs", function() require("fzf-lua").lsp_workspace_symbols() end,  desc = "[F]ind Workspace [S]ymbols" },
    { "<leader>fS", function() require("fzf-lua").lsp_document_symbols() end,  desc = "[F]ind Document [S]ymbols" },
    { "<leader>fc", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,  desc = "[F]ind Neovim [C]onfig files" },
    { "<leader>ft", function() require("todo-comments").todo() end,  desc = "[F]ind [T]odos, Fixmes, Hacks, ..." },
    { "]t", function() require("todo-comments").jump_next() end,  desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end,  desc = "Previous todo comment" },
 },
  config = function()
    require("fzf-lua").setup({
      fzf_opts = { ["--wrap"] = true },
      fzf_colors = {
        ["pointer"] = { "fg", { "Red" } },
        ["hl"] = { "fg", { "Red" } },
        ["hl+"] = { "fg", { "Red" } },
        ["fg+"] = { "fg", { "White" } },
        ["prompt"] = { "fg", { "Blue" } },
        ["query"] = { "fg", { "Yellow" } },
      },
      winopts = {
        preview = {
          wrap = "wrap",
        },
        formatter = "path.filename_first",
      },
    })

    local function fzf_directories(opts)
      local fzf_lua = require("fzf-lua")
      local fzf_path = require("fzf-lua.path")
      opts = opts or {}

      local cwd = vim.fn.getcwd()
      opts.prompt = fzf_path.shorten(cwd) .. "> "
      opts.cwd = cwd

      -- opts.fn_transform = function(x)
      --   return fzf_lua.utils.ansi_codes.magenta(x)
      -- end
      --
      opts.actions = {
        ["default"] = function(selected)
          vim.cmd("Oil --float " .. cwd .. "/" .. selected[1])
        end,
      }

      fzf_lua.fzf_exec("fd --type d", opts)
    end

    vim.api.nvim_create_user_command("FzfDirectories", function()
      fzf_directories({})
    end, {})
  end,
}

