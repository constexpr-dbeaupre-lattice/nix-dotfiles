{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if type -q tmux and; and not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
      end
    '';
  };

  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
    enableFishIntegration = true;
  };
}
