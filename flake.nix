{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          inputs.catppuccin.nixosModules.catppuccin

          hosts/default/configuration.nix
          {
            home-manager = {
              # Shared Home-Manager config. See configuration.nix for loading user settings
              extraSpecialArgs = { 
                inherit inputs;
              };
              backupFileExtension = "bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [
                inputs.catppuccin.homeManagerModules.catppuccin
                inputs.plasma-manager.homeManagerModules.plasma-manager 
              ];
            };
          }
        ];
      };
    };
}
