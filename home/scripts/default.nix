{ pkgs, ... }:

let
  screenshot-area = (import ./screenshot-area.nix { inherit pkgs; });
in
{
  home.packages = [
    screenshot-area
  ];
}
