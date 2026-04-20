{ config, pkgs, ... }:

{
  programs.ssh = {
    startAgent = true;
  };

  services.tailscale.enable = true;
}
