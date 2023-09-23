{ config, insomnia, pkgs, system, user, ... }:

{
  imports = [
    ./home/dotfiles
    ./home/programs/firefox
    ./home/programs/helix
    ./home/programs/hyprland
    ./home/programs/insomnia
    ./home/programs/kitty
    ./home/programs/neovim
    ./home/programs/waybar
    ./home/programs/wofi
    ./home/scripts
  ];

  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.05";
  #==== Gtk
  gtk = {
    enable = true;
    cursorTheme.name = "Bibata-Modern-Ice";
    cursorTheme.package = pkgs.bibata-cursors;
    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.catppuccin-papirus-folders.override {
      accent = "mauve";
      flavor = "mocha";
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  };
  #==== Xdg entries
  xdg.desktopEntries = {
    kitty = {
      name = "kitty";
      noDisplay = true;
    };
    nvim = {
      name = "Neovim";
      noDisplay = true;
    };
    htop = {
      name = "Htop";
      noDisplay = true;
    };
    swayimg = {
      name = "Swayimg";
      noDisplay = true;
    };
    insomnia = {
      name = "Insomnia";
      exec = "insomnia --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "insomnia";
      terminal = false;
    };
  };
  #==== Xdg dirs
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/desk";
    documents = "${config.home.homeDirectory}/docs";
    download = "${config.home.homeDirectory}/dwns";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pics";
    publicShare = "${config.home.homeDirectory}";
    templates = "${config.home.homeDirectory}";
    videos = "${config.home.homeDirectory}/vids";
    extraConfig = {
      XDG_SS_DIR = "${config.home.homeDirectory}/pics/screenshots";
      XDG_WALL_DIR = "${config.home.homeDirectory}/pics/wallpapers";
    };
  };
  #====

  home.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
  };

  home.sessionPath = [
    "${config.home.sessionVariables.XDG_DATA_HOME}/nvim/mason/bin"
  ];

  #==== Packages
  home.packages = with pkgs; [
    (webcord.override { electron_25 = electron_24; })
    jetbrains.idea-ultimate
    vscodium-fhs
    #====
    nil
    nixpkgs-fmt
    pcmanfm
    xarchiver
    rustup
  ];
  #==== Programs
  programs.git = {
    enable = true;
    userName = "wpcasarin";
    userEmail = "72427968+wpcasarin@users.noreply.github.com";
  };



  programs.bash.enable = true;
  programs.bash.profileExtra = ''[ "$(tty)" = "/dev/tty1" ] && exec Hyprland'';
  programs.bash.shellAliases = {
    update = "sudo nixos-rebuild switch --flake ~/flake/#nixos";
  };
  programs.starship.enable = true;
  programs.starship.enableBashIntegration = true;
  programs.home-manager.enable = true;
}

