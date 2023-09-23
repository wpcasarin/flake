{ pkgs, inputs, ... }:

{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    cliphist
    grim
    slurp
    swappy
    swaybg
    swayimg
    wl-clip-persist
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    extraConfig = pkgs.lib.fileContents ./hyprland.conf;
  };
}
