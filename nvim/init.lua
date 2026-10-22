-- Options.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.breakindent = true
vim.o.confirm = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
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
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.winborder = 'bold'
vim.o.wrap = true

-- Diagnostics.
vim.diagnostic.config({ virtual_text = true })

-- Package management.
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-changed', { clear = true }),
  callback = function(event)
    local name, kind = event.data.spec.name, event.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not event.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/mfussenegger/nvim-dap-python' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-mini/mini.statusline', version = 'main' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', version = '*' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
})

-- Colorscheme.
require('kanagawa').setup({
  overrides = function(colors)
    local theme = colors.theme
    return {
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      Pmenu = { fg = theme.ui.fg, bg = theme.ui.bg },
      PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg },
      PmenuThumb = { bg = theme.ui.bg_p2 },
      NormalFloat = { bg = theme.ui.bg },
      FloatBorder = { bg = theme.ui.bg },
      BlinkCmpMenu = { link = 'Pmenu' },
      BlinkCmpMenuBorder = { link = 'FloatBorder' },
      BlinkCmpMenuSelection = { link = 'PmenuSel' },
      BlinkCmpDoc = { link = 'NormalFloat' },
      BlinkCmpDocBorder = { link = 'FloatBorder' },
    }
  end,
})
require('kanagawa').load('dragon')

-- Icons.
require('nvim-web-devicons').setup()

-- Status.
require('mini.statusline').setup()

-- Files.
require('oil').setup()

-- Treesitter.
local languages = {
  'bash',
  'c',
  'cpp',
  'fish',
  'lua',
  'markdown',
  'markdown_inline',
  'nix',
  'python',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}
require('nvim-treesitter').install(languages)

-- Picker.
require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.99,
      height = 0.99,
      preview_width = 0.6,
    },
  },
})

-- Git.
require('gitsigns').setup({
  on_attach = function(buf)
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', ']h', function()
      gitsigns.nav_hunk('next')
    end, { buffer = buf, desc = 'Next hunk.' })
    vim.keymap.set('n', '[h', function()
      gitsigns.nav_hunk('prev')
    end, { buffer = buf, desc = 'Previous hunk.' })
    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { buffer = buf, desc = 'Preview hunk.' })
    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { buffer = buf, desc = 'Reset hunk.' })
    vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { buffer = buf, desc = 'Stage hunk.' })
  end,
})

-- Completions.
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

-- Formatting.
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    nix = { 'nixfmt' },
    python = { 'ruff_organize_imports', 'ruff_format' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})

-- LSP.
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { library = { vim.env.VIMRUNTIME } },
    },
  },
})
vim.lsp.enable({ 'clangd', 'lua_ls', 'nil_ls', 'ruff', 'ty' })

-- Debugging.
local dap = require('dap')
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'gdb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return vim.split(vim.fn.input('Arguments: '), ' ', { trimempty = true })
    end,
    cwd = '${workspaceFolder}',
  },
  {
    name = 'Attach',
    type = 'gdb',
    request = 'attach',
    pid = require('dap.utils').pick_process,
  },
}
dap.configurations.c = dap.configurations.cpp
require('dap-python').setup('debugpy-adapter')

-- Keymaps.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Write the current buffer.' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit the current buffer.' })
vim.keymap.set('n', '<leader>Q', '<cmd>wqa<CR>', { desc = 'Write all buffers and quit.' })
vim.keymap.set('n', '<leader>s', vim.diagnostic.open_float, { desc = 'Open float diagnostic.' })
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open directory of current file.' })
vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format buffer or selection.' })
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search files.' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search grep.' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search diagnostics.' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search current word.' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search existing buffers.' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help.' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Search keymaps.' })
vim.keymap.set('n', '<leader>fn', function()
  builtin.find_files({ cwd = vim.fn.stdpath('config'), follow = true })
end, { desc = 'Search Neovim files.' })
local widgets = require('dap.ui.widgets')
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint.' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Start or continue debugging.' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into.' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over.' })
vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step out.' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate debugging.' })
vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle debug REPL.' })
vim.keymap.set('n', '<leader>dh', widgets.hover, { desc = 'Hover debug value.' })
vim.keymap.set('n', '<leader>ds', function()
  widgets.centered_float(widgets.scopes)
end, { desc = 'Show debug scopes.' })
vim.keymap.set('n', '<leader>df', function()
  widgets.centered_float(widgets.frames)
end, { desc = 'Show debug frames.' })

-- Autocommands.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
  callback = function(event)
    if pcall(vim.treesitter.start, event.buf) then
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf
    vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = 'LSP references.' })
    vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = 'LSP implementations.' })
    vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = 'LSP definitions.' })
    vim.keymap.set('n', 'gro', builtin.lsp_document_symbols, { buffer = buf, desc = 'LSP document symbols.' })
    vim.keymap.set('n', 'grw', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'LSP workspace symbols.' })
    vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = 'LSP type definitions.' })
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
