{ 
  flake,
  inputs,
  pkgs,
  lib,
  ... 
}:
{
  imports = [ inputs.mnw.darwinModules.default ];

  environment.systemPackages =
    with pkgs; [ 
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
      "thunderbird"
    ];
    masApps = {
      "Xcode" = 497799835;
      "TickTick:To-Do List & Calendar" = 966085870;
      "Tailscale" = 1475387142;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.mnw = {
    enable = true;
    initLua = ''
      require("config")
      require("lz.n").load("plugins")
    '';
    extraBinPath = with pkgs; [
      nixd
      statix
      nil
      lua-language-server
      stylua
      clang-tools
      ripgrep
      fd
    ];
    plugins = {
      start = with pkgs; [
        vimPlugins.lz-n
        vimPlugins.gruvbox-nvim
        vimPlugins.nvim-lspconfig
      ];
      dev.config = {
        pure = ../../nvim;
        impure = "/Users/dan/.config/nix/nvim";
      };
    };
  };

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = flake.rev or flake.dirtyRev or null;
  system.primaryUser = "dan";

  system.stateVersion = 6;
  system.defaults.dock.autohide = true;
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users.dan.home = "/Users/dan";
}
