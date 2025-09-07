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
    eza
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
    tiny
    pass
    syncthing
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Danila Seliayeu";
    userEmail = "dan.seliayeu@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
autoload -U select-word-style
select-word-style bash
eval "$(zoxide init zsh)"
alias ls=eza
alias cd=z
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
