{ pkgs, config, ... }:

{
  imports = [
    ./llama.nix
    ./hermes.nix
    ./sandbox.nix
  ];

  environment.systemPackages = with pkgs; [
    bubblewrap
    llama-cpp
  ];
}
