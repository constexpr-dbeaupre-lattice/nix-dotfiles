{ pkgs, ... }:

{
  home.packages = [
    pkgs.claude-code
    pkgs.curl
    pkgs.fd
    pkgs.fzf
    pkgs.gh
    pkgs.jq
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.wl-clipboard
  ];
}
