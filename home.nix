{ config, pkgs, ... }:

let
  tmux-session-handler = pkgs.writeShellApplication {
    name = "tmux-session-handler";
    runtimeInputs = with pkgs; [
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
  };
in
{
  home.username = "dbeaupre";
  home.homeDirectory = "/home/dbeaupre";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.claude-code
    pkgs.curl
    pkgs.fd
    pkgs.gcc
    pkgs.lazygit
    pkgs.lua-language-server
    pkgs.neovim
    pkgs.nil
    pkgs.ripgrep
    pkgs.tree-sitter
    pkgs.tuicr
    pkgs.wl-clipboard
    tmux-session-handler
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    COLORTERM = "truecolor";
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableGitIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if type -q tmux and; and not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
      end
    '';
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

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

  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
  };

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

      bind-key -r f run-shell "tmux new-window ${tmux-session-handler}/bin/tmux-session-handler"
      bind-key -r h run-shell "tmux switch-client -t default"
      bind-key -r ^ last-window
    '';
  };

  editorconfig.enable = true;
  editorconfig.settings = {
    "*" = {
      charset = "utf-8";
      end_of_line = "lf";
      indent_style = "space";
      indent_size = 2;
      trim_trailing_whitespace = true;
      insert_final_newline = true;
    };
    "*.py" = {
      indent_size = 4;
    };
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/nvim";
}
