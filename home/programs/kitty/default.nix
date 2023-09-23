{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = pkgs.lib.fileContents ./kitty.conf;
  };
}
