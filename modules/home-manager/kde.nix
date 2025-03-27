{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.plasma.workspace.lookAndFeel = "org.kde.breezedark.desktop";
  # programs.plasma.workspace.theme = "breeze-dark";
  # programs.plasma.workspace.colorScheme = "BreezeDark";

  programs.plasma.input.touchpads = [
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
      tapToClick = true;
    }
  ];

}
