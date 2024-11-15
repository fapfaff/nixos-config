{ config, pkgs, ... }:
let
  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/main/misc/windows-error.jpg";
    sha256 = "62bdf59ca592d722e4c6ce86c5843a8c7c0a809f9bf62a8f7196c1634b2e18b8";
  };
in
{
  catppuccin.enable = true;
  catppuccin.accent = "blue";
  
  gtk.catppuccin.enable = true;
  gtk.catppuccin.gnomeShellTheme = true;

  gtk.catppuccin.icon.enable = true;
  gtk.catppuccin.icon.accent = "lavender";

  programs.starship.catppuccin.enable = true;

  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];

    userSettings = {
      workbench.colorTheme =  "Catppuccin Mocha";
      workbench.iconTheme = "catppuccin-mocha";   
    };
  };

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://" + wallpaper;
      picture-uri-dark = "file://" + wallpaper;
      picture-options = "wallpaper";
    };
  };
}
