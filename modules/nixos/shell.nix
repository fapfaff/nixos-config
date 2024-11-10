{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    wget
    tree
    jq
    fzf
    fastfetch
    btop
  ];
}

