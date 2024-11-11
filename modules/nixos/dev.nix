{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.users.fp.extraGroups = [ "docker" ];
}
