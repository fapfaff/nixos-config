{ config, pkgs, ... }:

{
  boot.loader = {
    efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
    };

    grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        version = 2;
        useOSProber = true;
    };
    
  };
}

