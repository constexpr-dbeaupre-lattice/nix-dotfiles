require("conform").setup({
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "ruff_format", "ruff_organize_imports" },
  },
  format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format" })
