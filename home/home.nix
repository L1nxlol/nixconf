{ pkgs, config, ... }:
{
  imports = [
    ./hyprland/hyprland.nix
    ./zsh/zsh.nix
    ./nvim/nvim.nix
    ./kitty/kitty.nix
    ./misc/misc.nix
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


  home.file.".local/share/fonts" = {
    source = ./resources/fonts;
    recursive = true;
  };

  home.file.".local/share/icons/AOSP Cursors" = {
    source = ./resources/cursor/aosp-cursors;
    recursive = true;
  };

  gtk.cursorTheme = {
    name = "AOSP Cursors";
    size = 14;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "AOSP Cursors";
    XCURSOR_SIZE = "14";
  };


  programs.git = {
    enable = true;
    settings = {
      user.name = "user";
      user.email = "DJTrump@cumallover.me";
    };
  };

  
  # services.swaync.enable = true;
}
