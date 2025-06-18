local function markdown_checkbox_toggle()
	local line = vim.api.nvim_get_current_line()
	local new_line = nil

	if line:match("%[ %]") then
		new_line = line:gsub("%[ %]", "[x]", 1)
	elseif line:match("%[x%]") then
		new_line = line:gsub("%[x%]", "[ ]", 1)
	end

	if new_line then
		vim.api.nvim_set_current_line(new_line)
	end
end

return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		ft = { "markdown", "Avante" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		keys = {
			{ "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Render Markdown" },
			{ "<leader>mc", markdown_checkbox_toggle, desc = "Toggle Markdown Checkbox" },
		},
		opts = {
			file_types = { "markdown", "Avante" },
			render = true,
			conceal = {
				current_line = true, -- <- this makes it render even the current line
			},
		},
	},
	{
		-- install without yarn or npm
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
