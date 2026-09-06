{ pkgs, config, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./zsh/zsh.nix
    ./nvim/nvim.nix
    ./kitty/kitty.nix
    ./rofi/rofi.nix
    ./misc/misc.nix
    ./obsidian/obsidian.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    btop
    fd
    qt6.qtdeclarative
    timg
    mpv
    fzf
    ytfzf
    jq
    curl
    mpg123
    musikcube
    gnome-boxes
    onlyoffice-desktopeditors

    # TERMINAL ANIMATIONS #
    peaclock
    cava 
    lavat 

    
    vimix-cursors
    nerd-fonts.geist-mono

    # HYPRLAND PLUGINS #
    (pkgs.callPackage ../cPkgs/hyprglass.nix {
      mkHyprlandPlugin = pkgs.hyprlandPlugins.mkHyprlandPlugin;
    })    
    # (pkgs.callPackage ../cPkgs/dynamic-cursors.nix {
    #   mkHyprlandPlugin = pkgs.hyprlandPlugins.mkHyprlandPlugin;
    # })
  ];


  gtk.enable = true;
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
  gtk.theme = {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };

  # home.file.".local/share/fonts" = {
  #   source = ./resources/fonts;
  #   recursive = true;
  # };

  home.pointerCursor = {
    enable = true;
    package = pkgs.vimix-cursors;
    name = "Vimix-cursors";
    size = 30;
    gtk.enable = true;
    x11.enable = true;

    hyprcursor.enable = true;
    hyprcursor.size = 24;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "user";
      user.email = "DJTrump@cumallover.me";
    };
  };

  
}
