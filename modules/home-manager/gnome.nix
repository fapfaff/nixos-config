{ config, pkgs, lib, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    paperwm
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
      };
      "org/gnome/mutter".experimental-features = [ "scale-monitor-framebuffer" ];

      "org/gnome/desktop/input-sources" = {
        show-all-sources = true;
        sources = [ (lib.gvariant.mkTuple [ "xkb" "eu" ]) (lib.gvariant.mkTuple [ "xkb" "us+altgr-intl" ]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" ];
      };

      "org/gnome/shell/extensions/pop-shell" = {
	      smart-gaps = true; 
      };
    };
  };
}
