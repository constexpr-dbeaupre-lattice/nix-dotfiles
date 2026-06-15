{ config, pkgs, ... }:

{
  home.username = "dbeaupre";
  home.homeDirectory = "/home/dbeaupre";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.curl
    pkgs.fd
    pkgs.gcc
    pkgs.lazygit
    pkgs.lua-language-server
    pkgs.neovim
    pkgs.nil
    pkgs.ripgrep
    pkgs.tree-sitter
    pkgs.wl-clipboard
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    COLORTERM = "truecolor";
  };

  programs.fish = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "David-Alexandre Beaupre";
      user.email = "david-alexandre.beaupre@latticesemi.com";
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };
  };

  programs.starship = {
    enable = true;
  };

  editorconfig.enable = true;
  editorconfig.settings = {
    "*" = {
      charset = "utf-8";
      end_of_line = "lf";
      indent_style = "space";
      indent_size = 2;
      trim_trailing_whitespace = true;
      insert_final_newline = true;
    };
    "*.py" = {
      indent_size = 4;
    };
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/nvim";
}
