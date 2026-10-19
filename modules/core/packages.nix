{ pkgs, ... }:

{
  home.packages = [
    pkgs.clang-tools
    pkgs.claude-code
    pkgs.curl
    pkgs.fd
    pkgs.gcc
    pkgs.lazygit
    pkgs.markdown-oxide
    pkgs.nil
    pkgs.opencode
    pkgs.ripgrep
    pkgs.ruff
    pkgs.tuicr
    pkgs.ty
    pkgs.wl-clipboard
  ];
}
