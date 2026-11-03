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

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  programs.home-manager.enable = true;
}
