{ config, pkgs, ... }: {
  home.username = "dan";
  home.homeDirectory = "/Users/dan";

  home.packages = with pkgs; [
    zip
    xz
    unzip

    ripgrep
    jq
    yq-go
    zoxide
    fzf
    bat

    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    glow

    btop
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Danila Seliayeu";
    userEmail = "dan.seliayeu@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  home.stateVersion = "25.05";
}
