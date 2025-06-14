-- Highlight text for some time after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 300, })
  end,
  desc = "Highlight yank",
})

-- Add scroll support to Snacks picker
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks-picker",
  callback = function()
    vim.keymap.set("n", "zl", "zl", { buffer = true })
    vim.keymap.set("n", "zh", "zh", { buffer = true })
  end,
})
