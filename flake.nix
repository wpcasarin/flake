{
  description = "Personal Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    insomnia.url = "github:nixos/nixpkgs/c66ccfa00c643751da2fd9290e096ceaa30493fc"; #electron 24
  };
  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      user = "welly";
      host = "nixos";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = false;
        config.allowUnfreePredicate = pkg:
          builtins.elem (nixpkgs.lib.getName pkg) [
            "idea-ultimate"
            "nvidia-settings"
            "nvidia-x11"
          ];
      };
    in
    {
      nixosConfigurations = {
        ${host} = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit host pkgs user; };
          modules = [
            ./nixos
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs pkgs system user; };
              home-manager.users.${user} = import ./home.nix;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      };
    };
}

