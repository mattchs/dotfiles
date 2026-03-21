return {
  "echasnovski/mini.snippets",
  version = false,
  opts = function()
    local gen_loader = require("mini.snippets").gen_loader
    return {
      snippets = {
        gen_loader.from_file("~/.config/nvim/snippets/global.json"),
        gen_loader.from_lang(),
      },
    }
  end,
}
