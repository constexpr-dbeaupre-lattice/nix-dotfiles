let
  identity = import ./identity.nix;
in
{
  programs.git = {
    enable = true;
    settings = {
      user.name = identity.name;
      user.email = identity.email;
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = identity.editor;
    };
  };
}
