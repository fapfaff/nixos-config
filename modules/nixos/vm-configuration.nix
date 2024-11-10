{ config, pkgs, ...}:

{
  virtualisation.virtualbox.guest = {
    enable = true;
    seamless = true;
    clipboard = true;
    dragAndDrop = true;
  };

  users.users.fp.extraGroups = [ "vboxsf" ];
}

