{ pkgs, system, nix-hug, ... }:


{
  environment.systemPackages = with pkgs; [ 
    # krita
    obs-studio
    blender

    # GAMES #
    prismlauncher
    heroic
    ckan
    lutris
  ];

  programs = {
    steam.enable = true;
  };
}
