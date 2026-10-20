{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
    pkgs.tree-sitter
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Symlink the Lua config out of the store so edits apply without a rebuild.
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/nvim";
}
