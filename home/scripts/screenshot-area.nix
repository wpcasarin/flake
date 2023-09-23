{ pkgs }:

pkgs.writeShellScriptBin "screenshot-area" ''
  ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.imagemagick}/bin/convert - -shave 1x1 PNG:- | ${pkgs.swappy}/bin/swappy -f - 
''
