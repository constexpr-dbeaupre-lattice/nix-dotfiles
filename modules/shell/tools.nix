{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat = {
    enable = true;
    config = {
      style = "numbers,changes,header";
      italic-text = "always";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    fileWidget.options = [
      "--preview 'bat --color=always --style=numbers --line-range=:300 {}'"
    ];
    changeDirWidget.options = [
      "--preview 'eza --tree --level=2 --color=always {}'"
    ];
  };
}
