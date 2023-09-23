{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      normal_window = true;
      display_generic = false;
      hide_scroll = true;
      allow_images = true;
      insensitive = true;
      no_actions = true;
    };
    style = pkgs.lib.fileContents ./style.css;
  };
}
