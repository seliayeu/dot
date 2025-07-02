{ 
  flake,
  inputs,
  pkgs,
  lib,
  ... 
}:
{
  # imports = [ inputs.mnw.darwinModules.default ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  #   programs.mnw = {
  #   enable = true;
  #   initLua = ''
  #     require("myconfig")
  #   '';
  #   plugins = {
  #     start = [
  #       pkgs.vimPlugins.oil-nvim
  #     ];
  #
  #     dev.myconfig = {
  #       pure = ./nvim;
  #       impure =
  #         # This is a hack it should be a absolute path
  #         # here it'll only work from this directory
  #         "/' .. vim.uv.cwd()  .. '/nvim";
  #     };
  #   };
  # };

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

  system.configurationRevision = flake.rev or flake.dirtyRev or null;
  system.primaryUser = "dan";

  system.stateVersion = 6;
  system.defaults.dock.autohide = true;
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users.dan.home = "/Users/dan";
}
