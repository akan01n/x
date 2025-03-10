-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- fix copilot suggestions
vim.g.ai_cmp = false

-- disable animations
vim.g.snacks_animate = false

-- iamcco/markdown-preview.nvim
--
-- set to 1, the nvim will auto close current preview window when changing
-- from Markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 0
