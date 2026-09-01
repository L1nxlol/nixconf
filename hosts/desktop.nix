{ config, pkgs, ... }:

{
  networking.hostName = "desktop"; 

  imports = [ ../pkgs/desktop.nix ]

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    53317 # Local Send
    2137
  ];
  networking.firewall.allowedUDPPorts = [ 
    53317 # Local Send
    2137
  ];
}
