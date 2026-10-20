local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("rebelot/kanagawa.nvim"),
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope.nvim"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason.nvim"),
  gh("nvim-lualine/lualine.nvim"),
  gh("folke/which-key.nvim"),
  gh("mfussenegger/nvim-dap"),
  gh("lewis6991/gitsigns.nvim"),
  gh("stevearc/oil.nvim"),
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },
  gh("NeogitOrg/neogit"),
  gh("stevearc/conform.nvim"),
  gh("kylechui/nvim-surround"),
}, { load = true })

for _, name in ipairs({
  "colorscheme",
  "telescope",
  "treesitter",
  "mason",
  "lsp",
  "lualine",
  "which-key",
  "dap",
  "gitsigns",
  "oil",
  "blink",
  "neogit",
  "conform",
  "surround",
}) do
  require("plugins." .. name)
end
