{ pkgs, ... }:

{
  home.packages = [
    pkgs.clang-tools
    pkgs.claude-code
    pkgs.curl
    pkgs.fd
    pkgs.gcc
    pkgs.gdb
    pkgs.gh
    pkgs.glow
    pkgs.jq
    pkgs.lazygit
    pkgs.lua-language-server
    pkgs.nil
    pkgs.nixfmt
    pkgs.python3Packages.debugpy
    pkgs.ripgrep
    pkgs.ruff
    pkgs.stylua
    pkgs.tuicr
    pkgs.ty
    pkgs.wl-clipboard
  ];
}
