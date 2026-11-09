{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      fg = "#c5c9c5";
      bg = "#181616";
      hl = "#c4b28a";
      "fg+" = "#c5c9c5";
      "bg+" = "#282727";
      "hl+" = "#c4b28a";
      border = "#625e5a";
      header = "#8ea4a2";
      gutter = "#181616";
      spinner = "#8a9a7b";
      info = "#737c73";
      pointer = "#c4746e";
      marker = "#a292a3";
      prompt = "#8ba4b0";
      label = "#8992a7";
    };
    fileWidget.options = [
      "--preview 'bat --color=always --style=numbers --line-range=:300 {}'"
    ];
    changeDirWidget.options = [
      "--preview 'eza --tree --level=2 --color=always {}'"
    ];
  };
}
