{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = "$directory$git_branch$git_status$nix_shell$env_var$fill$time$line_break$character";
      fill.symbol = " ";
      nix_shell.format = "[\\(nix\\)]($style) ";
      env_var.VIRTUAL_ENV = {
        format = "[\\(venv\\)]($style) ";
        style = "bold yellow";
      };
      directory = {
        truncation_length = 1;
        truncate_to_repo = false;
      };
      git_branch.format = "[$symbol$branch]($style) ";
      git_status.format = "([\\[$all_status$ahead_behind\\]]($style) )";
      time = {
        disabled = false;
        format = "[$time]($style)";
        time_format = "%H:%M";
        style = "dimmed white";
      };
      add_newline = true;
      package = {
        disabled = true;
      };
    };
  };
}
