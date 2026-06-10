vim.o.number = true
vim.o.relativenumber = true

vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

require('mini.extra').setup()
require('mini.files').setup()
require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.statusline').setup()
