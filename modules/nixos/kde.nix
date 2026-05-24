{
  config,
  pkgs,
  lib,
  ...
}:

{
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver.xkb = {
      layout = "eu,de";
      variant = ",";
      options = "grp:win_space_toggle";
    };
  };

  security.pam.services.fp = {
    kwallet = {
      enable = true;
      package = pkgs.kdePackages.kwallet-pam;
    };
  };
}
