{
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
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      environment.systemPackages =
        with pkgs; [ 
          neovim
          oh-my-posh
          yazi
          mas
          direnv
          nix-direnv
          tmux
          mpv
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

      nix.settings.experimental-features = "nix-command flakes";

      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.primaryUser = "dan";

      system.stateVersion = 6;
      system.defaults.dock.autohide = true;
      system.defaults.NSGlobalDomain._HIHideMenuBar = true;

      nixpkgs.hostPlatform = "aarch64-darwin";
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    darwinConfigurations."dan-MacbookAir-6" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}


