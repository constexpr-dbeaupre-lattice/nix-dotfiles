{ config, pkgs, ... }:

let
  tmux-session-handler = "${config.home.homeDirectory}/.local/bin/tmux-session-handler";
in
{
  # Runtime dependencies of the script, which is symlinked from scripts/.
  home.packages = with pkgs; [
    fd
    fzf
  ];

  home.file.".local/bin/tmux-session-handler".source = ../scripts/tmux-session-handler.sh;

  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    focusEvents = true;
    prefix = "C-a";
    keyMode = "vi";
    sensibleOnTop = false;
    extraConfig = ''
      set -g renumber-windows on
      set -as terminal-features ",*:RGB"
      set -as terminal-overrides ",*:Tc"

      bind r source-file ~/.config/tmux/tmux.conf
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "fg=color7 bg=default"
      set -g status-left " #S "
      set -g status-left-style "fg=color5"
      set -g status-left-length 96
      set -g status-right ""
      set -g status-right-length 0
      setw -g window-status-current-style "fg=color6 bg=default bold"
      setw -g window-status-current-format "#I:#W "
      setw -g window-status-style "fg=color3"

      bind-key -r f run-shell "tmux new-window ${tmux-session-handler}"
      bind-key -r h run-shell "tmux switch-client -t default"
      bind-key -r ^ last-window
    '';
  };
}
