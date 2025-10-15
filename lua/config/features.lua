-- ************************************************************************ --
--
-- Highlight text for some time after yanking
--
-- ************************************************************************ --

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
	desc = "Highlight yank",
})

-- ************************************************************************ --
--
-- Add scroll support to Snacks picker
--
-- ************************************************************************ --

vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks-picker",
	callback = function()
		vim.keymap.set("n", "zl", "zl", { buffer = true })
		vim.keymap.set("n", "zh", "zh", { buffer = true })
	end,
})

-- ************************************************************************ --
--
-- Aggressive fold fix that waits for tree-sitter
--
-- ************************************************************************ --

local function refresh_folds()
	-- Only for normal file buffers with expr folding
	if vim.bo.buftype ~= "" or vim.wo.foldmethod ~= "expr" then
		return
	end

	-- Check if tree-sitter parser exists and is ready
	local has_parser = pcall(vim.treesitter.get_parser)

	if has_parser then
		-- Force immediate fold recalculation
		vim.cmd("silent! normal! zx")
	else
		-- If parser not ready, try again after a delay
		vim.defer_fn(function()
			if vim.api.nvim_buf_is_valid(vim.api.nvim_get_current_buf()) then
				vim.cmd("silent! normal! zx")
			end
		end, 50)
	end
end

-- Apply on multiple events to catch whenever buffer becomes visible
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter", "BufEnter" }, {
	callback = function()
		-- Triple-nested schedule to absolutely ensure tree-sitter is done
		vim.schedule(function()
			vim.schedule(function()
				vim.schedule(function()
					refresh_folds()
				end)
			end)
		end)
	end,
})
