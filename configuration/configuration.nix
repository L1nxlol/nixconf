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
      ./locales.nix
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
      bigclock = "en";
      default_input = "password";
      dur_file_path = "/home/user/Nix/home/resources/bh.dur";
    };
  };

  system.stateVersion = "26.05"; # dont touch
}
