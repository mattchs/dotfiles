return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    explorer = { enabled = true },
  },
  keys = {
    { "<leader>.e", function() Snacks.explorer() end, desc = "File Explorer" },
  }
}
