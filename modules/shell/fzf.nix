{
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
