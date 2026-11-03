{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if type -q tmux; and not set -q TMUX
        tmux attach-session -t default; or tmux new-session -s default
      end
    '';
  };
}
