{ config, pkgs, ... }:

{
  catppuccin.enable = true;
  boot.loader.grub.catppuccin.enable = false;
}
