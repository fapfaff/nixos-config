{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    package = pkgs.chromium;
   
    extensions = [
      # Bitwarden Password Manager
      # https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb
      "nngceckbapebfimnlniiiahkandclblb"

      # uBlock Origin
      # https://chromewebstore.google.com/detail/ublock/epcnnfbjfcgphgdmggkamkmgojdagdnn
      "epcnnfbjfcgphgdmggkamkmgojdagdnn"
    ];

    commandLineArgs = [
      "--ozone-platform=wayland"
      "--enable-features=TouchpadOverscrollHistoryNavigation"
    ];

  };

  gtk.enable = true;
}

