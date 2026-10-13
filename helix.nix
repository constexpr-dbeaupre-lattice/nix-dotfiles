{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "kanagawa-dragon";

      editor = {
        clipboard-provider = "wayland";
        cursorline = true;
        default-yank-register = "+";
        line-number = "relative";
        popup-border = "all";
        scrolloff = 8;
        shell = [ "fish" "-c" ];
        soft-wrap.enable = true;
      };
    };
  };
}
