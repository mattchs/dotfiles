vim.keymap.set("n", "<leader>o", function() require('oil').toggle_float() end, {desc="Open Snack Explorer"})
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close Neovim" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write to the current file" })
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({lsp_format = "fallback"})
end, { desc = "Format current file" })


