{
  description = "Kieran's NixOS configuration!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      # Test
      vm = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit unstable;
        };
        modules = [ ./hosts/vm/configuration.nix ];
      };

      # Work

      # Personal
      darkarmy = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit unstable;
        };
        modules = [ ./hosts/darkarmy/configuration.nix ];
      };
    };
    
    homeConfigurations = {
      kieran = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
  };
}
