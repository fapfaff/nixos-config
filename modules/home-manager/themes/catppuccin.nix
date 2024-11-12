{ config, pkgs, ... }:

{
  catppuccin.enable = true;
  gtk.catppuccin.enable = true;
  gtk.catppuccin.gnomeShellTheme = true;

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
}
