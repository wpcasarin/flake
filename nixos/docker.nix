{ ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    enableNvidia = false;
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };
}
