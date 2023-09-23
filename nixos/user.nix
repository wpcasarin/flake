{ pkgs, user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    description = "Wellington";
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
