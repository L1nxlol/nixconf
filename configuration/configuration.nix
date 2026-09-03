{ config, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
      ../pkgs/common.nix
      ./bootloader.nix
      ./network.nix
      ./bluetooth.nix
      ./audio.nix
    ];

  programs.dconf.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;  
  

  users.users."user" = {
    isNormalUser = true;
    home = "/home/user";
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };


  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "dur_file";
      full_color = true;
      auth_fails = "3";
      battery_id = "BAT_1";
      bigclock = "en";
      default_input = "password";
      dur_file_path = "/home/user/Nix/home/resources/bh.dur";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
