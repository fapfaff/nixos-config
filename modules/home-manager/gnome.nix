{ config, pkgs, lib, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    paperwm
    dash-to-dock
    impatience
    caffeine
    clipboard-indicator
    media-controls
    top-bar-organizer
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

      "org/gnome/desktop/peripherals/touchpad" = {
        click-method = "areas";
      };

      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile="flat";
      };

      "org/gnome/shell/keybindings" = {
        toggle-message-tray = [ "<Super>m" ]; # Disable Super+V for clipboard indicator
      };

      # PaperWM
      "org/gnome/shell/extensions/paperwm" = {
        selection-border-size = 4;
      };

      "org/gnome/shell/extensions/paperwm/keybindings" = {
        center-vertically = [ "" ]; # Disable Super+V for clipboard indicator
      };

      

      # Extensions
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        autohide = false;
        custom-theme-shrink = true;
        dash-max-icon-size = 48;

        transparency-mode="FIXED";
        custom-background-color = true;
        background-opacity = 0.0;
      };

      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = ["<Super>v"];
      };

      "org/gnome/shell/extensions/top-bar-organizer" = {
        # Move media controls to the right box
        left-box-order=["activities"  "WorkspaceMenu"  "FocusButton"  "OpenPositionButton"];
        center-box-order=["dateMenu"];
        right-box-order=["Media Controls"  "screenRecording"  "clipboardIndicator"  "screenSharing"  "dwellClick"  "a11y"  "keyboard"  "quickSettings"];
      };
    };
  };
}
