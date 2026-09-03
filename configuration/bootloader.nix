{ config, pkgs, ... }

{

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 7;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";

        extraEntries = ''
          menuentry "Reboot to UEFI firmware" {
          fwsetup
          }
          '';
      };

      grub2-theme = {
        enable = true;
        theme = "vimix";
      };
    };
  };
};
