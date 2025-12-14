{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    input.touchpads = [
      {
        enable = true;

        name = "ELAN07A8:00 04F3:31EC Touchpad";
        vendorId = "04f3";
        productId = "31ec";


        accelerationProfile = "default";
        disableWhileTyping = false;
        leftHanded = false;
        middleButtonEmulation = true;
        naturalScroll = true;
        pointerSpeed = 0;
        scrollSpeed = 0.5;
        tapToClick = true;
      }
    ];

    # Avoid overriding gtk settings every time plasma starts, which results in conflicts.
    configFile.kded5rc = {
      "Module-gtkconfig"."autoload" = false;
    };

    # Start fcitx, Required for vietnamese telex. See configuration.nix for more information.
    configFile."kwinrc".Wayland = {
      "InputMethod" = {
        shellExpand = true;
        value = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      };
    };
  };
}
