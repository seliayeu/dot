{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mnw.url = "github:Gerg-L/mnw";
  };
  outputs = { self, nix-darwin, nixpkgs, home-manager, nixpkgs-stable, ... }@inputs:
  let
    mkDarwinHost = {
      name,
      system,
      specialArgs ? {},
    }:nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ./hosts/${name}
        home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dan = import ./home/${name};
          }
      ];
      specialArgs = {
        inherit inputs;
        flake = self;
      } // specialArgs;
    };
    mkHost = {
      name,
      system,
      specialArgs ? {},
    }:nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/${name}
        home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dotuncle = import ./home/${name};
            home-manager.extraSpecialArgs = { inherit inputs; inherit system; };
          }
      ];
      specialArgs = {
        inherit inputs;
        flake = self;
      } // specialArgs;
    };
  in {
    nixosConfigurations.kagerou = mkHost rec { 
      name = "kagerou";
      system = "x86_64-linux";
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    };
    darwinConfigurations.hoshizora = mkDarwinHost {
      name = "hoshizora";
      system = "aarch64-darwin";
    };
  };
}


