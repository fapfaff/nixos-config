{ config, pkgs, ... }:
let
  thunderbird = {
    theme = "mocha";
    accent = "blue";
  };

  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/main/misc/windows-error.jpg";
    sha256 = "62bdf59ca592d722e4c6ce86c5843a8c7c0a809f9bf62a8f7196c1634b2e18b8";
  };
in
{
  catppuccin.enable = true;
  catppuccin.accent = "blue";

  catppuccin.pointerCursor = {
    enable = true;
    accent = "light";
  };
  
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

  programs.thunderbird.package = pkgs.thunderbird.override {
    extraPolicies = {
      ExtensionSettings = {
        "{f6d05f0c-39a8-5c4d-96dd-4852202a8244}" = {
          installation_mode = "normal_installed";
          install_url = "https://github.com/catppuccin/thunderbird/raw/refs/heads/main/themes/${thunderbird.theme}/${thunderbird.theme}-${thunderbird.accent}.xpi";
          updates_enabled = true;
        };
      };
    };
  };
}
