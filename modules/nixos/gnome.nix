{ config, pkgs, ...}:

{
  services.xserver = {
    exportConfiguration = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
