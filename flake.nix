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
  {
    darwinConfigurations."dan-MacbookAir-6" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dan = import ./home.nix;
          }
      ];
      specialArgs = {
        inherit inputs;
        flake = self;
      };
    };
  };
}


