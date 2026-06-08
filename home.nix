{ config, pkgs, ... }:

{
  home.username = "dbeaupre";
  home.homeDirectory = "/home/dbeaupre";

  # Keep this matched to the release you are pinning to.
  home.stateVersion = "26.05";

  # Let Home Manager manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.wl-clipboard
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    COLORTERM = "truecolor";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
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

  programs.helix = {
    enable = true;
    settings = {
      theme = "kanagawa-dragon";
      editor = {
        true-color = true;
        line-number = "relative";
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };

  programs.starship = {
    enable = true;
  };
}
