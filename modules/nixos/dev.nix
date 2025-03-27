{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.users.fp.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
  ];
}
