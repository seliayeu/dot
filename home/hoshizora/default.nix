{ pkgs, inputs, ... }: {
  imports = [
    ../tiny.nix
    inputs.mnw.homeManagerModules.default
  ];


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
    zulu24
  ];

  programs.git = {
    enable = true;
    userName = "Danila Seliayeu";
    userEmail = "dan.seliayeu@gmail.com";
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
        vimPlugins.snacks-nvim
      ];
      dev.config = {
        pure = ../../nvim;
        impure = "/Users/dan/.config/nix/nvim";
      };
    };
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
