{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, mnw }@inputs:
  let
    mkDarwinHost = {
      name,
      system,
      specialArgs ? {},
    }:nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/${name}
        home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dan = import ./home/${name}.nix;
          }
      ];
      specialArgs = {
        inherit inputs;
        flake = self;
      } // specialArgs;
    };
  in {
    nixosConfigurations = { };
    darwinConfigurations.hoshizora = mkDarwinHost {
      name = "hoshizora";
      system = "aarch64-darwin";
    };
  };
}


