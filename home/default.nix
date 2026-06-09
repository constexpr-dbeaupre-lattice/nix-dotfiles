{ config, pkgs, ... }:

{
  home.username = "dbeaupre";
  home.homeDirectory = "/home/dbeaupre";

  # Keep this matched to the release you are pinning to.
  home.stateVersion = "26.05";

  # Let Home Manager manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.fd
    pkgs.gcc
    pkgs.lua-language-server
    pkgs.nil
    pkgs.ripgrep
    pkgs.wl-clipboard
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    COLORTERM = "truecolor";
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "David-Alexandre Beaupre";
      user.email = "david-alexandre.beaupre@latticesemi.com";
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = "hx";
    };
  };

  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };
}
