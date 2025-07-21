local function set_key_mappings(args)
	local set = vim.keymap.set -- for conciseness
	local opts

	-- Goto definition
	opts = { buffer = args.buf, silent = true, desc = "Goto definition" }
	set("n", "gd", vim.lsp.buf.definition, opts)
	set("n", "<leader>lgd", vim.lsp.buf.definition, opts)

	-- Set hover
	opts = { buffer = args.buf, silent = true, desc = "Hover" }
	set("n", "K", vim.lsp.buf.hover, opts)
	set("n", "<leader>lK", vim.lsp.buf.hover, opts)

	-- Set signature help
	opts = { buffer = args.buf, silent = true, desc = "Signature help" }
	set("n", "<c-s-K>", vim.lsp.buf.signature_help, opts)
	set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)

	-- Set goto implementation
	opts = { buffer = args.buf, silent = true, desc = "Goto implementation" }
	set("n", "gD", vim.lsp.buf.implementation, opts)
	set("n", "<leader>lgD", vim.lsp.buf.implementation, opts)

	-- Set goto type definition
	opts = { buffer = args.buf, silent = true, desc = "Goto type definition" }
	set("n", "1gD", vim.lsp.buf.type_definition, opts)
	set("n", "<leader>lgt", vim.lsp.buf.type_definition, opts)

	-- Set show references
	opts = { buffer = args.buf, silent = true, desc = "Show references" }
	set("n", "gr", vim.lsp.buf.references, opts)
	set("n", "<leader>lsr", vim.lsp.buf.references, opts)

	-- Set goto declaration
	opts = { buffer = args.buf, silent = true, desc = "Goto declaration" }
	set("n", "<c-]>", vim.lsp.buf.declaration, opts)
	set("n", "<leader>lgc", vim.lsp.buf.declaration, opts)

	-- Refactor - rename
	set("n", "<leader>lrr", vim.lsp.buf.rename, { buffer = args.buf, silent = true, desc = "Refactor - rename" })

	-- Code actions
	set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf, silent = true, desc = "Code actions" })
	set("n", "<leader>lca", vim.lsp.buf.code_action, { buffer = args.buf, silent = true, desc = "Code actions" })

	-- Toggle inlay hint
	set("n", "<leader>lih", function()
		-- toggles inlay hints
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { buffer = args.buf, silent = true, desc = "Toggle inlay hints" })

	-- diagnostics
	set(
		"n",
		"<leader>xi",
		vim.diagnostic.open_float,
		{ buffer = args.buf, silent = true, desc = "Open floating diagnostics" }
	)
	set("n", "<leader>xk", function()
		vim.diagnostic.jump({ float = true, count = -1 })
	end, { buffer = args.buf, silent = true, desc = "Goto previous diagnostics" })
	set("n", "<leader>xj", function()
		vim.diagnostic.jump({ float = true, count = 1 })
	end, { buffer = args.buf, silent = true, desc = "Goto next diagnostics" })
end

local function organize_imports_on_save(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if client and client.name == "jdtls" then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				local params = {
					command = "java.edit.organizeImports",
					arguments = { vim.uri_from_bufnr(0) },
				}
				-- vim.lsp.buf_request(0, "workspace/executeCommand", params, function() end)
				-- vim.lsp.buf_request(0, "workspace/executeCommand", params, function(err, _, _)
				--   if err then
				--     vim.notify("Organize Imports failed: " .. vim.inspect(err), vim.log.levels.ERROR)
				--   end
				-- end)
				vim.lsp.buf_request_sync(0, "workspace/executeCommand", params, 1000)
			end,
		})
	end
end

local function setup_auto_cmd()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
		callback = function(args)
			-- organize_imports_on_save(args)
			set_key_mappings(args)
		end,
	})
end

return {
	{ "folke/neoconf.nvim", cmd = "Neoconf", opts = {} },
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
			{ "j-hui/fidget.nvim", opts = {} },

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

			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua", -- Used to format Lua code
					"prettier", -- Used to format JavaScript/TypeScript code
					"prettierd", -- Used to format JavaScript/TypeScript code
					"ruff",
					"black", -- Used to format Python code
					"isort", -- Used to sort Python imports
				},
				run_on_start = true,
			})

			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jdtls",
					"jsonls",
					"ts_ls",
					"html",
					"pyright",
				},
				run_on_start = true,
			})

			-- Configure language servers
			-- vim.lsp.config("jdtls", {
			-- 	settings = {
			-- 		java = {
			-- 			format = {
			-- 				enabled = true,
			-- 				settings = {
			-- 					url = vim.fn.stdpath("config") .. "/java/beumer-eclipse-formatter.xml",
			-- 					profile = "Crisplant formatter", -- This should match the profile name in the XML
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- })

			-- Enable language servers
			vim.lsp.enable("lua_ls")
			-- 		vim.lsp.enable("ols")
			-- 		vim.lsp.enable("zls")
			-- 		vim.lsp.enable("clangd")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("html")
			-- vim.lsp.enable("rust_analyzer")
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
		lazy = false, -- This plugin is already lazy
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
