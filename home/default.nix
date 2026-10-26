{ ... }:

{
  imports = [
    ./packages.nix
    ./editorconfig.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./shell
  ];

  home.username = "dbeaupre";
  home.homeDirectory = "/home/dbeaupre";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
