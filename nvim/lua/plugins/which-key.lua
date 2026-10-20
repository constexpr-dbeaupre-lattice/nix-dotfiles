local wk = require("which-key")

wk.setup({})
wk.add({
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Git" },
  { "<leader>d", group = "Debug" },
  { "<leader>c", group = "Code" },
})
