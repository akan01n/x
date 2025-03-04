-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local conform = require("conform")

vim.keymap.set({ "n", "v" }, "<M-S-f>", function()
	conform.format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 5000,
	})
end, { desc = "Format file or range" })

vim.keymap.set("n", "<M-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<M-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
vim.keymap.set("n", "<leader>d", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.set("n", ",d", '"_d', { desc = "Delete to Blackhole" })
vim.keymap.set("n", ",c", '"_c', { desc = "Copy to Blackhole" })
