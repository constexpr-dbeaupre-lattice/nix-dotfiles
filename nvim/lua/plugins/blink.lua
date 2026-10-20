require("blink.cmp").setup({
  keymap = { preset = "default" },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
