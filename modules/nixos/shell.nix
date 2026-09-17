{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    curl
    wget
    tree
    jq
    fzf
    fastfetch
    btop
    starship
    psmisc # fuser
    lsof
  ];

  systemd.tmpfiles.rules = [
    "L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
  ];
}
