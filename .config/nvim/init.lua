require("config.lazy")
require("config.options")

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true }),
  pattern = "*", -- Apply to all file types
  callback = function()
    -- Save the current cursor position and view
    local view = vim.fn.winsaveview()
    -- Search and replace trailing whitespaces
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    -- Restore the cursor position and view
    vim.fn.winrestview(view)
  end,
})
