[1mdiff --git a/lazy-lock.json b/lazy-lock.json[m
[1mindex 278b46e..be332cb 100644[m
[1m--- a/lazy-lock.json[m
[1m+++ b/lazy-lock.json[m
[36m@@ -1,15 +1,11 @@[m
 {[m
   "auto-session": { "branch": "main", "commit": "f0eb3d69848389869572b82b336d7a6887e88e43" },[m
[31m-  "avante.nvim": { "branch": "main", "commit": "7e9f7b57de46534a9113980ec950a2b05eb8861f" },[m
[31m-  "blink-cmp-copilot": { "branch": "main", "commit": "439cff78780c033aa23cf061d7315314b347e3c1" },[m
[31m-  "blink.cmp": { "branch": "main", "commit": "bae4bae0eedd1fa55f34b685862e94a222d5c6f8" },[m
[32m+[m[32m  "blink.cmp": { "branch": "main", "commit": "327fff91fe6af358e990be7be1ec8b78037d2138" },[m
   "bufferline.nvim": { "branch": "main", "commit": "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3" },[m
   "conform.nvim": { "branch": "master", "commit": "9fd3d5e0b689ec1bf400c53cbbec72c6fdf24081" },[m
[31m-  "copilot.lua": { "branch": "master", "commit": "93adf9844dcbe09a37e7a72eaa286d33d38bf628" },[m
   "fidget.nvim": { "branch": "main", "commit": "e32b672d8fd343f9d6a76944fedb8c61d7d8111a" },[m
   "fzf-lua": { "branch": "main", "commit": "6bb2a266facf0d16e30371b6b433037d1828a674" },[m
   "gitsigns.nvim": { "branch": "main", "commit": "20ad4419564d6e22b189f6738116b38871082332" },[m
[31m-  "img-clip.nvim": { "branch": "main", "commit": "e7e29f0d07110405adecd576b602306a7edd507a" },[m
   "lazy.nvim": { "branch": "main", "commit": "f0f5bbb9e5bfae5e6468f9359ffea3d151418176" },[m
   "lazydev.nvim": { "branch": "main", "commit": "c2dfe354571a8255c5d3e96a9a4c297c89ce2347" },[m
   "log-highlight.nvim": { "branch": "main", "commit": "cac07cf2d1937038f6627a450bef4664f096b120" },[m
[1mdiff --git a/lua/config/features.lua b/lua/config/features.lua[m
[1mindex 0a471f1..d6a110c 100644[m
[1m--- a/lua/config/features.lua[m
[1m+++ b/lua/config/features.lua[m
[36m@@ -32,15 +32,15 @@[m [mvim.api.nvim_create_autocmd("FileType", {[m
 -- Fix folding issues with Tree-sitter and LSP[m
 --[m
 -- ************************************************************************ --[m
[31m-vim.api.nvim_create_autocmd("FileType", {[m
[31m-	pattern = "*",[m
[31m-	callback = function()[m
[31m-		-- Give time for Tree-sitter/LSP/syntax to initialize[m
[31m-		vim.defer_fn(function()[m
[31m-			if vim.wo.foldmethod == "expr" or vim.wo.foldmethod == "syntax" then[m
[31m-				-- Force fold recalculation[m
[31m-				vim.cmd("normal! zx")[m
[31m-			end[m
[31m-		end, 200)[m
[31m-	end,[m
[31m-})[m
[32m+[m[32m-- vim.api.nvim_create_autocmd("FileType", {[m
[32m+[m[32m-- 	pattern = "*",[m
[32m+[m[32m-- 	callback = function()[m
[32m+[m[32m-- 		-- Give time for Tree-sitter/LSP/syntax to initialize[m
[32m+[m[32m-- 		vim.defer_fn(function()[m
[32m+[m[32m-- 			if vim.wo.foldmethod == "expr" or vim.wo.foldmethod == "syntax" then[m
[32m+[m[32m-- 				-- Force fold recalculation[m
[32m+[m[32m-- 				vim.cmd("normal! zx")[m
[32m+[m[32m-- 			end[m
[32m+[m[32m-- 		end, 200)[m
[32m+[m[32m-- 	end,[m
[32m+[m[32m-- })[m
[1mdiff --git a/lua/config/lazy.lua b/lua/config/lazy.lua[m
[1mindex 90db7d9..1dd8fae 100644[m
[1m--- a/lua/config/lazy.lua[m
[1m+++ b/lua/config/lazy.lua[m
[36m@@ -3,17 +3,17 @@[m [mlocal lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"[m
 [m
 -- Fetch lazy.nvim plugin (if not already fetched)[m
 if not (vim.uv or vim.loop).fs_stat(lazypath) then[m
[31m-  local lazyrepo = "https://github.com/folke/lazy.nvim.git"[m
[31m-  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })[m
[31m-  if vim.v.shell_error ~= 0 then[m
[31m-    vim.api.nvim_echo({[m
[31m-      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },[m
[31m-      { out,                            "WarningMsg" },[m
[31m-      { "\nPress any key to exit..." },[m
[31m-    }, true, {})[m
[31m-    vim.fn.getchar()[m
[31m-    os.exit(1)[m
[31m-  end[m
[32m+[m	[32mlocal lazyrepo = "https://github.com/folke/lazy.nvim.git"[m
[32m+[m	[32mlocal out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })[m
[32m+[m	[32mif vim.v.shell_error ~= 0 then[m
[32m+[m		[32mvim.api.nvim_echo({[m
[32m+[m			[32m{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },[m
[32m+[m			[32m{ out, "WarningMsg" },[m
[32m+[m			[32m{ "\nPress any key to exit..." },[m
[32m+[m		[32m}, true, {})[m
[32m+[m		[32mvim.fn.getchar()[m
[32m+[m		[32mos.exit(1)[m
[32m+[m	[32mend[m
 end[m
 [m
 -- Add lazy to path[m
[36m@@ -21,47 +21,47 @@[m [mvim.opt.rtp:prepend(lazypath)[m
 [m
 -- Setup lazy.nvim[m
 require("lazy").setup({[m
[31m-  spec = {[m
[31m-    -- List of directories with plugins to load[m
[31m-    { import = "plugins.libs" },[m
[31m-    { import = "plugins.editor" },[m
[31m-    { import = "plugins.ui" },[m
[31m-    { import = "plugins.ui.colorschemes" },[m
[31m-    { import = "plugins.coding" },[m
[31m-    --		{ import = "plugins.languages" },[m
[31m-  },[m
[31m-  defaults = {[m
[31m-    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.[m
[31m-    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.[m
[31m-    lazy = false,[m
[31m-    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,[m
[31m-    -- have outdated releases, which may break your Neovim install.[m
[31m-    version = false, -- always use the latest git commit[m
[31m-    -- version = "*", -- try installing the latest stable version for plugins that support semver[m
[31m-  },[m
[31m-  install = { colorscheme = { "tokyonight" } },[m
[31m-  checker = {[m
[31m-    enabled = true, -- check for plugin updates periodically[m
[31m-    notify = false, -- notify on update[m
[31m-  },                -- automatically check for plugin updates[m
[31m-  change_detection = {[m
[31m-    -- automatically check for config file changes and reload the ui[m
[31m-    enabled = true,[m
[31m-    notify = false, -- get a notification when changes are found[m
[31m-  },[m
[31m-  performance = {[m
[31m-    rtp = {[m
[31m-      -- disable some rtp plugins[m
[31m-      disabled_plugins = {[m
[31m-        "gzip",[m
[31m-        -- "matchit",[m
[31m-        -- "matchparen",[m
[31m-        "netrwPlugin",[m
[31m-        "tarPlugin",[m
[31m-        "tohtml",[m
[31m-        "tutor",[m
[31m-        "zipPlugin",[m
[31m-      },[m
[31m-    },[m
[31m-  },[m
[32m+[m	[32mspec = {[m
[32m+[m		[32m-- List of directories with plugins to load[m
[32m+[m		[32m{ import = "plugins.libs" },[m
[32m+[m		[32m{ import = "plugins.editor" },[m
[32m+[m		[32m{ import = "plugins.ui" },[m
[32m+[m		[32m{ import = "plugins.ui.colorschemes" },[m
[32m+[m		[32m{ import = "plugins.coding" },[m
[32m+[m		[32m--		{ import = "plugins.languages" },[m
[32m+[m	[32m},[m
[32m+[m	[32mdefaults = {[m
[32m+[m		[32m-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.[m
[32m+[m		[32m-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.[m
[32m+[m		[32mlazy = false,[m
[32m+[m		[32m-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,[m
[32m+[m		[32m-- have outdated releases, which may break your Neovim install.[m
[32m+[m		[32mversion = false, -- always use the latest git commit[m
[32m+[m		[32m-- version = "*", -- try installing the latest stable version for plugins that support semver[m
[32m+[m	[32m},[m
[32m+[m	[32minstall = { colorscheme = { "tokyonight" } },[m
[32m+[m	[32mchecker = {[m
[32m+[m		[32menabled = true, -- check for plugin updates periodically[m
[32m+[m		[32mnotify = false, -- notify on update[m
[32m+[m	[32m}, -- automatically check for plugin updates[m
[32m+[m	[32mchange_detection = {[m
[32m+[m		[32m-- automatically check for config file changes and reload the ui[m
[32m+[m		[32menabled = true,[m
[32m+[m		[32mnotify = false, -- get a notification when changes are found[m
[32m+[m	[32m},[m
[32m+[m	[32mperformance = {[m
[32m+[m		[32mrtp = {[m
[32m+[m			[32m-- disable some rtp plugins[m
[32m+[m			[32mdisabled_plugins = {[m
[32m+[m				[32m"gzip",[m
[32m+[m				[32m-- "matchit",[m
[32m+[m				[32m-- "matchparen",[m
[32m+[m				[32m"netrwPlugin",[m
[32m+[m				[32m"tarPlugin",[m
[32m+[m				[32m"tohtml",[m
[32m+[m				[32m"tutor",[m
[32m+[m				[32m"zipPlugin",[m
[32m+[m			[32m},[m
[32m+[m		[32m},[m
[32m+[m	[32m},[m
 })[m
[1mdiff --git a/lua/plugins/coding/blink-cmp.lua b/lua/plugins/coding/blink-cmp.lua[m
[1mindex 2baee3f..60dea2a 100644[m
[1m--- a/lua/plugins/coding/blink-cmp.lua[m
[1m+++ b/lua/plugins/coding/blink-cmp.lua[m
[36m@@ -1,12 +1,12 @@[m
 return {[m
 	"saghen/blink.cmp",[m
 	-- use a release tag to download pre-built binaries[m
[31m-	version = "1.6.0",[m
[32m+[m	[32mversion = "1.7.0",[m
 	-- enabled = false,[m
[31m-	dependencies = {[m
[31m-		"giuxtaposition/blink-cmp-copilot",[m
[31m-		--     "rafamadriz/friendly-snippets" ,[m
[31m-	},[m
[32m+[m	[32m-- dependencies = {[m
[32m+[m	[32m-- 	"giuxtaposition/blink-cmp-copilot",[m
[32m+[m	[32m-- 	--     "rafamadriz/friendly-snippets" ,[m
[32m+[m	[32m-- },[m
 [m
 	opts = {[m
 		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)[m
[1mdiff --git a/lua/plugins/coding/copilot.lua b/lua/plugins/coding/copilot.lua[m
[1mdeleted file mode 100644[m
[1mindex 33a5f35..0000000[m
[1m--- a/lua/plugins/coding/copilot.lua[m
[1m+++ /dev/null[m
[36m@@ -1,75 +0,0 @@[m
[31m-return {[m
[31m-	{[m
[31m-		"zbirenbaum/copilot.lua",[m
[31m-		-- enabled = false,[m
[31m-		event = "InsertEnter",[m
[31m-		cmd = "Copilot",[m
[31m-		build = ":Copilot auth",[m
[31m-		opts = {[m
[31m-			suggestion = {[m
[31m-				enabled = true,[m
[31m-				auto_trigger = true,[m
[31m-				hide_during_completion = true,[m
[31m-				-- keymap = {[m
[31m-				-- 	accept = "<M-l>",[m
[31m-				-- 	next = "<M-]>",[m
[31m-				-- 	prev = "<M-[>",[m
[31m-				-- 	dismiss = "<C-]>",[m
[31m-				-- },[m
[31m-			},[m
[31m-			panel = { enabled = false },[m
[31m-			filetypes = {[m
[31m-				java = true,[m
[31m-				markdown = true,[m
[31m-				help = true,[m
[31m-			},[m
[31m-		},[m
[31m-	},[m
[31m-	{[m
[31m-		"giuxtaposition/blink-cmp-copilot",[m
[31m-		dependencies = {[m
[31m-			"zbirenbaum/copilot.lua",[m
[31m-		},[m
[31m-	},[m
[31m-	{[m
[31m-		"yetone/avante.nvim",[m
[31m-		event = "VeryLazy",[m
[31m-		version = false, -- Never set this value to "*"! Never![m
[31m-		---@module 'avante'[m
[31m-		---@type avante.Config[m
[31m-		opts = {[m
[31m-			-- add any opts here[m
[31m-			-- for example[m
[31m-			provider = "copilot",[m
[31m-		},[m
[31m-		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`[m
[31m-		build = "make",[m
[31m-		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows[m
[31m-		dependencies = {[m
[31m-			"nvim-treesitter/nvim-treesitter",[m
[31m-			"nvim-lua/plenary.nvim",[m
[31m-			"MunifTanjim/nui.nvim",[m
[31m-			"MeanderingProgrammer/render-markdown.nvim",[m
[31m-			"folke/snacks.nvim", -- for input provider snacks[m
[31m-			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons[m
[31m-			"zbirenbaum/copilot.lua", -- for providers='copilot'[m
[31m-			{[m
[31m-				-- support for image pasting[m
[31m-				"HakonHarnes/img-clip.nvim",[m
[31m-				event = "VeryLazy",[m
[31m-				opts = {[m
[31m-					-- recommended settings[m
[31m-					default = {[m
[31m-						embed_image_as_base64 = false,[m
[31m-						prompt_for_file_name = false,[m
[31m-						drag_and_drop = {[m
[31m-							insert_mode = true,[m
[31m-						},[m
[31m-						-- required for Windows users[m
[31m-						use_absolute_path = true,[m
[31m-					},[m
[31m-				},[m
[31m-			},[m
[31m-		},[m
[31m-	},[m
[31m-}[m
