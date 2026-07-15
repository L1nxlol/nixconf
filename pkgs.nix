{ zen-browser, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # NVIM #
    neovim
    tree-sitter


    # RICE #
    quickshell
    awww
    fastfetch


    # INTERNET #
    zen-browser.packages.${pkgs.system}.default
    tor-browser


    # BASIC TOOLS #
    p7zip
    unzip
    ffmpeg
    gcc
    git
    wl-clipboard
    libnotify
    swaynotificationcenter
    caligula


    # GUI BASIC TOOLS # 
    kitty
    eog
    totem
    localsend
    krita
    gimp
    obs-studio


    # SYSTEM #
    zsh
    dconf
    home-manager
    
      
  # LANGUAGES #
    lua
    adoptopenjdk-icedtea-web


    # DE #
    grim
    slurp
    rofi
    cliphist
    playerctl


    # GAMES #
    prismlauncher
    heroic
    ckan
    lutris
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    xorg.libXext
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXi
    xorg.libXrandr
    xorg.libXScrnSaver
    xorg.libXxf86vm
  ];


  programs = {
    dconf.enable = true;
    hyprland.enable = true;
    zsh.enable = true;
    hyprlock.enable = true;
    steam.enable = true;
    java.enable = true;
    java.package = pkgs.jdk25;
  };
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.displayManager.ly.enable = true;
  services.flatpak.enable = true;
}
