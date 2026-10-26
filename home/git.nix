{
  programs.git = {
    enable = true;
    settings = {
      user.name = "David-Alexandre Beaupre";
      user.email = "david-alexandre.beaupre@latticesemi.com";
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };
  };
}
