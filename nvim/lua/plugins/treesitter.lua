local languages = {
  "bash", "c", "cpp", "fish", "lua", "markdown", "markdown_inline",
  "nix", "python", "toml", "vim", "vimdoc", "yaml",
}

-- Parsers are compiled locally and need a C compiler and the tree-sitter CLI.
require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
