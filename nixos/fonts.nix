{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    fira-code
    liberation_ttf
    maple-mono
    maple-mono-NF
    maple-mono-SC-NF
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
