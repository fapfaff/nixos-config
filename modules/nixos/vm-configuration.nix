{ config, pkgs, ...}:

{
  virtualisation.virtualbox.guest = {
    enable = true;
    seamless = true;
    clipboard = true;
  };

  users.users.fp.extraGroups = [ "vboxsf" ];
}

