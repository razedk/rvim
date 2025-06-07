local function set_key_mappings(args)
  local set = vim.keymap.set -- for conciseness
  local opts

  -- Goto definition
  opts = { buffer = args.buf, silent = true, desc = "Goto definition" }
  set("n", "gd", function() vim.lsp.buf.definition({}) end, opts)
  set("n", "<leader>lgd", function() vim.lsp.buf.definition({}) end, opts)

  -- Set hover
  opts = { buffer = args.buf, silent = true, desc = "Hover" }
  set("n", "K", vim.lsp.buf.hover, opts)
  set("n", "<leader>lK", vim.lsp.buf.hover, opts)

  -- Set signature help
  set("n", "<c-s-K>", vim.lsp.buf.signature_help, { buffer = args.buf, silent = true, desc = "Signature help" })
  set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = args.buf, silent = true, desc = "Signature help" })

  -- Set goto implementation
  set("n", "gD", function() vim.lsp.buf.implementation({}) end,
    { buffer = args.buf, silent = true, desc = "Goto implementation" })
  set("n", "<leader>lgD", function() vim.lsp.buf.implementation({}) end,
    { buffer = args.buf, silent = true, desc = "Goto implementation" })

  -- Set goto type definition
  set("n", "1gD", function() vim.lsp.buf.type_definition({}) end,
    { buffer = args.buf, silent = true, desc = "Goto type definition" })
  set("n", "<leader>lgt", function() vim.lsp.buf.type_definition({}) end,
    { buffer = args.buf, silent = true, desc = "Goto type definition" })

  -- Set show references
  set("n", "gr", function() vim.lsp.buf.references() end, { buffer = args.buf, silent = true, desc = "Show references" })
  set("n", "<leader>lsr", function() vim.lsp.buf.references() end,
    { buffer = args.buf, silent = true, desc = "Show references" })

  -- Set goto declaration
  set("n", "<c-]>", function() vim.lsp.buf.declaration({}) end,
    { buffer = args.buf, silent = true, desc = "Goto declaration" })
  set("n", "<leader>lgc", function() vim.lsp.buf.declaration({}) end,
    { buffer = args.buf, silent = true, desc = "Goto declaration" })

  -- Refactor - rename
  set("n", "<leader>lrr", vim.lsp.buf.rename, { buffer = args.buf, silent = true, desc = "Refactor - rename" })

  -- Code actions
  set("n", "<leader>lca", vim.lsp.buf.code_action, { buffer = args.buf, silent = true, desc = "Code actions" })

  -- Toggle inlay hint
  set("n", "<leader>lih", function()
    -- toggles inlay hints
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { buffer = args.buf, silent = true, desc = "Toggle inlay hints" })

  -- diagnostics
  set("n", "<leader>xi", vim.diagnostic.open_float,
    { buffer = args.buf, silent = true, desc = "Open floating diagnostics" })
  set("n", "<leader>xk", function()
    vim.diagnostic.jump({ float = true, count = -1 })
  end, { buffer = args.buf, silent = true, desc = "Goto previous diagnostics" })
  set("n", "<leader>xj", function()
    vim.diagnostic.jump({ float = true, count = 1 })
  end, { buffer = args.buf, silent = true, desc = "Goto next diagnostics" })
end

local function setup_auto_cmd()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(args)
      -- -- The following two autocommands are used to highlight references of the
      -- -- word under your cursor when your cursor rests there for a little while.
      -- --    See `:help CursorHold` for information about when this is executed
      -- --
      -- -- When you move your cursor, the highlights will be cleared (the second autocommand).
      -- local client = vim.lsp.get_client_by_id(event.data.client_id)
      -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      --   local highlight_augroup =
      --       vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
      --   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      --     buffer = event.buf,
      --     group = highlight_augroup,
      --     callback = vim.lsp.buf.document_highlight,
      --   })
      --
      --   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      --     buffer = event.buf,
      --     group = highlight_augroup,
      --     callback = vim.lsp.buf.clear_references,
      --   })
      --
      --   vim.api.nvim_create_autocmd("LspDetach", {
      --     group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
      --     callback = function(event2)
      --       vim.lsp.buf.clear_references()
      --       vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
      --     end,
      --   })
      -- end

      -- The following code creates a keymap to toggle inlay hints in your
      -- code, if the language server you are using supports them
      --
      -- This may be unwanted, since they displace some of your code
      -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      --   vim.keymap.set("n", "<leader>uh", function()
      --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      --   end, { desc = "Toggle [U]i Inlay [H]ints" })
      -- end

      set_key_mappings(args)
    end,
  })
end

return {
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      -- LSP and notify updates in the down right corner
      { "j-hui/fidget.nvim",       opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      "saghen/blink.cmp",
    },
    keys = {
      {
        "<leader>d",
        function()
          vim.diagnostic.open_float(0, { scope = "line" })
        end,
        mode = "n",
        desc = "Diagnostics (line)",
      },
    },
    config = function()
      setup_auto_cmd()

      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" }, })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",    -- Used to format Lua code
          "prettierd", -- Used to format JavaScript/TypeScript code
        },
      })

      -- Configure language servers
      vim.lsp.config("jdtls", {
        settings = {
          java = {
            format = {
              enabled = true,
              settings = {
                url = vim.fn.stdpath('config') .. "/java/beumer-eclipse-formatter.xml",
                profile = "Crisplant formatter" -- This should match the profile name in the XML
              }
            }
          }
        },
      })

      -- Enable language servers
      vim.lsp.enable("lua_ls")
      -- 		vim.lsp.enable("ols")
      -- 		vim.lsp.enable("zls")
      -- 		vim.lsp.enable("clangd")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("html")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("jdtls")
      vim.lsp.enable("eslint")
    end,
  },
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  -- Rustacean vim for all our Rust needs
  -- INFO: We can't install rust-analyzer via Mason, as this will conflict with
  -- rustaceanvim. Therefore ensure it is installed manually for example using
  -- rustup and available in the path. This has the added benefit, of having
  -- the rust-analyzer in the version fitting our current rust installation:
  --
  -- ```shell
  -- rustup component add rust-analyzer
  -- ```
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        tools = {
          float_win_config = {
            border = "rounded",
          },
        },
      }
    end,
  },
}
