{ pkgs, host, user, config, ... }:

{
  imports =
    [
      ./boot.nix
      ./docker.nix
      ./fonts.nix
      ./hardware-configuration.nix
      ./locales.nix
      ./user.nix
    ];

  #==== Networking
  networking.networkmanager.enable = true;
  networking.hostName = "${host}";
  #==== Services
  services.getty.autologinUser = "${user}";
  services.logind.lidSwitch = "ignore";
  services.xserver.videoDrivers = [ "nvidia" ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  #==== Hardware
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  #==== Security
  security.polkit.enable = true;
  security.rtkit.enable = true;
  #==== Xdg portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
  ];
  #==== System packages
  environment.systemPackages = with pkgs; [
    bat
    coreutils
    eza
    fd
    ffmpeg
    findutils
    fzf
    gcc
    gnumake
    htop
    hyperfine
    imagemagick
    libnotify
    p7zip
    parallel
    procs
    ripgrep
    sysstat
    unzip
    wget
    xdg-utils
    zip
  ];
  #==== Programns
  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
  #==== Nix
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };
  #==== System
  system.stateVersion = "23.05";
}
