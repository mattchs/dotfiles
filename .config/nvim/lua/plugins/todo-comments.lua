return {
  "folke/todo-comments.nvim",
  opts = {},
  keys = {
    { "<leader>cc", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>cf", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
}
