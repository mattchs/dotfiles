return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = vim.fn.getcwd() .. "/assets",
      process_cmd = "convert - -quality 70 -",
      extension = "avif", ---@type string | fun(): string
      -- show_dir_path_in_prompt = true, ---@type boolean | fun(): boolean
    },
    filetypes = {
      typst = {
        template = [[#image("./assets/$FILE_NAME"))]], ---@type string | fun(context: table): string
      },
    },
  },
  keys = {
    -- suggested keymap
    {
      "<leader>pi",
      function()
        require("img-clip").paste_image()
      end,
      desc = "Paste image from system clipboard",
    },
  },
}
