{ inputs, system, ... }:

let
  insominia-pkg = import inputs.insomnia
    {
      inherit system;
    };
in
{
  home.packages = [
    insominia-pkg.insomnia
  ];
}
