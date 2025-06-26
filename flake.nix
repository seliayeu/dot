{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      environment.systemPackages =
        [ 
          pkgs.neovim
          pkgs.oh-my-posh
          pkgs.yazi
          pkgs.mas
          pkgs.direnv
          pkgs.nix-direnv
          pkgs.tmux
          pkgs.mpv
        ];
      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "zap";
          upgrade = true;
        };
        taps = [
          "nikitabobko/tap"
        ];
        brews = [];
        casks = [
          "transmission"
          "basictex"
	  "middleclick"
          "nikitabobko/tap/aerospace"
          "raycast"
          "bitwarden"
          "discord"
          "obsidian"
          "mullvadvpn"
          "zotero"
          "anki"
          "font-zed-mono-nerd-font"
        ];
        masApps = {
          "Xcode" = 497799835;
          "TickTick:To-Do List & Calendar" = 966085870;
          "Tailscale" = 1475387142;
        };
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.primaryUser = "dan";

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      system.defaults.dock.autohide = true;

       system.defaults.NSGlobalDomain._HIHideMenuBar = true;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#dan-MacbookAir-6
    darwinConfigurations."dan-MacbookAir-6" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}


