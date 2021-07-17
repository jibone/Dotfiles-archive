{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jibone";
  home.homeDirectory = "/Users/jibone";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Packages to install
  home.packages = [
    pkgs.ripgrep # rg, faster grepper.
    pkgs.wget    # wget all the web things.
    pkgs.jq      # making JSON look nice.
  ];

  # Install bat, a better cat
  programs.bat.enable = true;

  # Setup zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    initExtra = ''
      source ~/.custom_paths
      source ~/.tokens
      . ~/.nix-profile/etc/profile.d/nix.sh
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };

  # Starship prompt, infinity and beyond.
  programs.starship = {
    enable = true;
    # enableZshIntegration = true;
  };

  # Setup Git
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "J Shamsul Bahri";
    userEmail = "jibone@gmail.com";
  };
}
