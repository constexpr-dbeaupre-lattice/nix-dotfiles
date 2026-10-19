let
  identity = import ./identity.nix;
in
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = identity.name;
      user.email = identity.email;
      ui.editor = identity.editor;
    };
  };
}
