{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;

    daemon.settings = {
      default-address-pools = [
        {
          base = "10.200.0.0/16";
          size = 24;
        }
        {
          base = "10.201.0.0/16";
          size = 24;
        }
      ];
    };
  };

  users.users.fp.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    glib
  ];
}
