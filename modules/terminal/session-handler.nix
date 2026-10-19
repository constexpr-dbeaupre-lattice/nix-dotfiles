{
  writeShellApplication,
  fd,
  fzf,
  tmux,
}:

writeShellApplication {
  name = "tmux-session-handler";
  runtimeInputs = [
    fd
    fzf
    tmux
  ];
  text = ''
    DIRECTORIES=(
      "$HOME"
      "$HOME/development"
    )

    # One argument was provided, select it as a directory.
    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(fd . "''${DIRECTORIES[@]}" --type directory --max-depth 1 --full-path --base-directory "$HOME" | sed "s|^$HOME/||" | fzf || true)
        [[ $selected ]] && selected="$HOME/$selected"
    fi

    [[ ! $selected ]] && exit 0

    selected_name=$(basename "$selected" | tr . _)

    tmux_running=$(pgrep tmux || true)

    if [[ -z "''${TMUX:-}" ]] && [[ -z "$tmux_running" ]]; then
        tmux new-session -s "$selected_name" -c "$selected"
        exit 0
    fi

    if ! tmux has-session -t "$selected_name"; then
        tmux new-session -ds "$selected_name" -c "$selected"
        tmux select-window -t "$selected_name:1"
    fi

    tmux switch-client -t "$selected_name"
  '';
}
