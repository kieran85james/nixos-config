{
  description = "Kieran's NixOS configuration!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    agenix,
    nixpkgs,
    nixpkgs-stable,
    nix-darwin,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    homeManagerModules = import ./modules/home-manager;
    nixosModules = import ./modules/nixos;

    nixosConfigurations = {
      # Virtual Machine
      fsociety = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/fsociety
          inputs.disko.nixosModules.disko
          agenix.nixosModules.default
        ];
      };

      # Work
      e-corp = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/e-corp
          inputs.disko.nixosModules.disko
          agenix.nixosModules.default
        ];
      };

      # Personal
      darkarmy = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/darkarmy
          inputs.disko.nixosModules.disko
          agenix.nixosModules.default
        ];
      };
    };
    
    homeConfigurations = {
      "phillip@e-corp" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {
          inherit inputs outputs;
          hostname = "e-corp";
        };
        modules = [ ./home/kieran/e-corp.nix ];
      };
    };
  };
}
