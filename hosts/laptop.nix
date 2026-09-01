{ config, pkgs, ... }:

{
  networking.hostName = "laptop";

  imports = [ 
    ../configuration.nix
    ../pkgs/laptop.nix 
  ];

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    53317 # Local Send
  ];
  networking.firewall.allowedUDPPorts = [ 
    53317 # Local Send
  ];
}
