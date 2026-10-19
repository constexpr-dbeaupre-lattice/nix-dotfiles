{
  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
    enableFishIntegration = true;
  };
}
