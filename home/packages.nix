{ pkgs, ... }:

{
  home.packages = [
    pkgs.clang-tools
    pkgs.claude-code
    pkgs.curl
    pkgs.fd
    pkgs.fzf
    pkgs.gcc
    pkgs.gdb
    pkgs.gh
    pkgs.glow
    pkgs.jq
    pkgs.lazygit
    pkgs.lua-language-server
    pkgs.neovim
    pkgs.nil
    pkgs.nixfmt
    pkgs.python3Packages.debugpy
    pkgs.ripgrep
    pkgs.ruff
    pkgs.stylua
    pkgs.tree-sitter
    pkgs.tuicr
    pkgs.ty
    pkgs.wl-clipboard
  ];
}
