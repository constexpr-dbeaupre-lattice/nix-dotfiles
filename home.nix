{ ... }:

{
  imports = [
    ./modules/core
    ./modules/shell
    ./modules/vcs
    ./modules/editor
    ./modules/terminal
  ];

  home.username = "dbeaupre";
  home.homeDirectory = "/home/dbeaupre";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
