-- Servers provided by the Nix configuration (modules/core/packages.nix).
local servers = { "clangd", "markdown_oxide", "ruff", "ty" }

-- nil is not available on Windows.
if vim.fn.has("win32") == 0 then
  table.insert(servers, "nil_ls")
end

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gr", vim.lsp.buf.references, "References")
    map("gi", vim.lsp.buf.implementation, "Implementation")
    map("K", vim.lsp.buf.hover, "Hover")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
  end,
})

vim.diagnostic.config({ virtual_text = true, severity_sort = true })
