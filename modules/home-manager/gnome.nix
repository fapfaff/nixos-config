{ config, pkgs, lib, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    paperwm
    dash-to-dock
  ];
in
{

  home.packages = with pkgs; [
    gnome.gnome-terminal
  ] ++ extensions;
  
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = map (extension: extension.extensionUuid) extensions; 
        favorite-apps = [
          "org.gnome.Terminal.desktop"
          "org.gnome.Nautilus.desktop"
          "code.desktop"
          "chromium-browser.desktop"
        ];
      };
      "org/gnome/mutter".experimental-features = [ "scale-monitor-framebuffer" ];

      "org/gnome/desktop/input-sources" = {
        show-all-sources = true;
        sources = [ (lib.gvariant.mkTuple [ "xkb" "eu" ]) (lib.gvariant.mkTuple [ "xkb" "us+altgr-intl" ]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        autohide = false;
        custom-theme-shrink = true;
        dash-max-icon-size = 48;

        custom-background-color = true;
        background-opacity = 0.0;
      };
    };
  };
}
