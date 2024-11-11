{ config, pkgs, ... }:

rec {
  home.packages = with pkgs.gnomeExtensions; [
    pop-shell
    dash-to-panel
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = map (extension: extension.extensionUuid) home.packages; 
      };

      "org/gnome/shell/extensions/pop-shell" = {
	      smart-gaps = true; 
      };
    };
  };
}
