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

  services.searx = {
    enable = true;
    package = pkgs.searxng;
    runInUwsgi = false;

    settings = {
      server = {
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = "paste output of: openssl rand -hex 32";
      };
      search.formats = [ "html" "json" ];
      limiter = false;
    };
  };
}
