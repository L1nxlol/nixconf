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
    caligula
    upower
    helvum


    # GUI BASIC TOOLS # 
    kitty
    eog
    totem
    localsend
    gimp
    thunar

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
    java.enable = true;
    java.package = pkgs.jdk25;
  };
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services = { 
    flatpak.enable = true;
    upower.enable = true;
  };
}
