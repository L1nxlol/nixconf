{ config, pkgs, ... }:

{
  networking.hostName = "laptop";

  imports = [ 
    ../configuration.nix
    ../../pkgs/laptop.nix 
  ];

  services.displayManager.ly.settings.battery_id = "BAT_1";

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    53317 # Local Send
  ];
  networking.firewall.allowedUDPPorts = [ 
    53317 # Local Send
  ];
}
