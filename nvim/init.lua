vim.g.have_nerd_font = true
vim.g.localmapleader = ' '
vim.g.mapleader = ' '

vim.o.breakindent = true
vim.o.confirm = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.linebreak = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shell = 'fish'
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.undofile = true
vim.o.winborder = 'rounded'
vim.o.wrap = true

vim.pack.add({
  { src = 'https://github.com/chentoast/marks.nvim' },
  { src = 'https://github.com/folke/snacks.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-mini/mini.ai',                        version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.icons',                     stable = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.pairs',                     version = 'stable' },
  { src = 'https://github.com/nvim-mini/mini.statusline',                version = 'stable' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',          version = 'main' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  { src = 'https://github.com/saghen/blink.cmp',                         version = vim.version.range('^1') },
  { src = 'https://github.com/stevearc/oil.nvim' }
})

require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    documentation = { auto_show = true },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
})

require('kanagawa').load('lotus')

require('mini.icons').setup()
require('oil').setup()

require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.statusline').setup()

require('marks').setup {
  builtin_marks = { '<', '>', '^' },
}

require('nvim-treesitter').install({ 'c', 'cpp', 'lua', 'markdown', 'python' })

require('snacks').setup({ picker = { enabled = true } })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'lua', 'markdown', 'python' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.lsp.enable({ 'lua_ls', 'nil_ls' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, { desc = 'Open float diagnostic.' })
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, { desc = 'Help pages' })
vim.keymap.set('n', '<leader>fl', function() vim.lsp.buf.format() end, { desc = 'For Lua buffer.' })
vim.keymap.set('n', '<leader>fm', function() Snacks.picker.marks() end, { desc = 'Marks' })
