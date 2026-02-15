return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      -- These options will be passed to require("conform").format()
      timeout_ms = 500, -- Timeout for synchronous formatting
      lsp_format = "fallback", -- Use LSP formatting if no conform formatters are found
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
      haskell = { "fourmolu" },
      elm = { "elm-format" },
      purescript = { "purescript-tidy" },
    },
  },
}
