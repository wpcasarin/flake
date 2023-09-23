{ pkgs, ... }:

{
  home.file =
    {
      ".config/waybar/config".source = ./config.json;
      ".config/waybar/style.css".source = ./style.css;
    };
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = (pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }));
  };
}
