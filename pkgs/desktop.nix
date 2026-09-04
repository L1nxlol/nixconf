{ pkgs, system, nix-hug, ... }:

let
  qwen3 = import ../cPkgs/models/Qwen3-30B-A3B.nix {
    inherit nix-hug system;
  };
in 
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

    # MODELS #
    qwen3
  ];

  programs = {
    steam.enable = true;
  };
}
