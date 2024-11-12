{ config, pkgs, ... }:

{
  catppuccin.enable = true;
  gtk.catppuccin.enable = true;
  gtk.catppuccin.gnomeShellTheme = true;

  programs.starship.catppuccin.enable = true;
}
