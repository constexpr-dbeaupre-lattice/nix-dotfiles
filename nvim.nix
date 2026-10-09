{ config, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals = {
      have_nerd_font = true;
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      breakindent = true;
      confirm = true;
      cursorline = true;
      expandtab = true;
      ignorecase = true;
      linebreak = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      scrolloff = 8;
      shell = "fish";
      shiftwidth = 2;
      showmode = false;
      showtabline = 0;
      signcolumn = "yes";
      smartcase = true;
      softtabstop = 2;
      swapfile = false;
      tabstop = 2;
      undofile = true;
      winborder = "rounded";
      wrap = true;
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    # Used by the Snacks pickers.
    dependencies = {
      fd.enable = true;
      ripgrep.enable = true;
    };

    colorschemes.kanagawa.enable = true;
    colorscheme = "kanagawa-dragon";

    plugins = {
      mini-ai.enable = true;
      mini-icons.enable = true;
      mini-pairs.enable = true;
      mini-statusline.enable = true;

      oil.enable = true;
      render-markdown.enable = true;

      marks = {
        enable = true;
        settings.builtin_marks = [ "<" ">" "^" ];
      };

      snacks = {
        enable = true;
        settings.picker.enabled = true;
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          c
          cpp
          go
          groovy
          lua
          markdown
          python
          rust
        ];
      };

      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "default";
          appearance.nerd_font_variant = "mono";
          completion.documentation.auto_show = true;
          sources.default = [ "lsp" "path" "snippets" "buffer" ];
          fuzzy.implementation = "prefer_rust_with_warning";
        };
      };

      lspconfig.enable = true;
    };

    lsp.servers = {
      lua_ls.enable = true;
      nil_ls.enable = true;

      # Provided by the development shells.
      clangd = { enable = true; package = null; };
      gopls = { enable = true; package = null; };
      groovyls = { enable = true; package = null; };
      pyright = { enable = true; package = null; };
      rust_analyzer = { enable = true; package = null; };
    };

    autoGroups.highlight-yank.clear = true;
    autoCmd = [
      {
        event = "TextYankPost";
        desc = "Highlight when yanking text";
        group = "highlight-yank";
        callback.__raw = "function() vim.hl.on_yank() end";
      }
    ];

    keymaps = [
      { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; }
      { mode = "n"; key = "<leader>d"; action.__raw = "function() vim.diagnostic.open_float() end"; options.desc = "Open float diagnostic."; }
      { mode = "n"; key = "<leader>e"; action = "<cmd>Oil<CR>"; options.desc = "Open parent directory."; }
      { mode = "n"; key = "<leader>fb"; action.__raw = "function() Snacks.picker.buffers() end"; options.desc = "Buffers."; }
      { mode = "n"; key = "<leader>fd"; action.__raw = "function() Snacks.picker.diagnostics() end"; options.desc = "Diagnostics."; }
      { mode = "n"; key = "<leader>ff"; action.__raw = "function() Snacks.picker.files() end"; options.desc = "Find files."; }
      { mode = "n"; key = "<leader>fg"; action.__raw = "function() Snacks.picker.grep() end"; options.desc = "Grep."; }
      { mode = "n"; key = "<leader>fh"; action.__raw = "function() Snacks.picker.help() end"; options.desc = "Help pages."; }
      { mode = "n"; key = "<leader>fm"; action.__raw = "function() Snacks.picker.marks() end"; options.desc = "Marks."; }
      { mode = "n"; key = "<leader>ll"; action.__raw = "function() vim.lsp.buf.format() end"; options.desc = "Format buffer."; }
    ];
  };
}
