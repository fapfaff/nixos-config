{ config, pkgs, ... }:

{
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  security.pam.services.fp = {
    kwallet = {
      enable = true;
      package = pkgs.kdePackages.kwallet-pam;
    };
  };
}
