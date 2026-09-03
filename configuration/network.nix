{ config, pkgs, ... }:

{
  networking = {
    wireless.enable = true;  
    networkmanager.enable = true;
    nameservers = [ "9.9.9.9"];
  };

  programs.nm-applet.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  services.printing.enable = true;
}
