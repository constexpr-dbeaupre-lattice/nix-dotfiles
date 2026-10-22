{ pkgs, ... }:

{
  home.packages = [
    pkgs.clang-tools
    pkgs.claude-code
    pkgs.cursor-cli
    pkgs.curl
    pkgs.fd
    pkgs.gcc
    pkgs.glow
    pkgs.lazygit
    pkgs.lua-language-server
    pkgs.nil
    pkgs.ripgrep
    pkgs.ruff
    pkgs.tuicr
    pkgs.ty
    pkgs.wl-clipboard
  ];
}
