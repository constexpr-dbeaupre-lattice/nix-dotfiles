{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    sideloadInitLua = true;
    extraPackages = [
      pkgs.clang-tools
      pkgs.lua-language-server
      pkgs.nil
      pkgs.nixfmt
      pkgs.ruff
      pkgs.stylua
      pkgs.tree-sitter
      pkgs.ty
    ];
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/nvim";
}
