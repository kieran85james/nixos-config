{
  description = "Kieran's NixOS configuration!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      vm = lib.nixosSystem {
        inherit system;
        modules = [ ./host/vm/configuration.nix ];
      };
      darkarmy = lib.nixosSystem {
        inherit system;
        modules = [ ./host/darkarmy/configuration.nix ];
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
