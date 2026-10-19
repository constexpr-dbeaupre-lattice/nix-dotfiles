{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if type -q tmux and; and not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
      end
    '';
  };
}
