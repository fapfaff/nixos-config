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

    configFile.kded5rc = {
      "Module-gtkconfig"."autoload" = false;
    };

    configFile."kwinrc".Wayland = {
      "InputMethod" = {
        shellExpand = true;
        value = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      };
    };
  };

  home.file.".config/fcitx5/config".text = ''
[Hotkey]
EnumerateWithTriggerKeys=True
EnumerateForwardKeys=
EnumerateBackwardKeys=
EnumerateSkipFirst=False
ModifierOnlyKeyTimeout=250

[Hotkey/TriggerKeys]
0=Super+ISO_Next_Group
1=Zenkaku_Hankaku
2=Hangul

[Hotkey/AltTriggerKeys]

[Hotkey/EnumerateGroupForwardKeys]
0=Super+space

[Hotkey/EnumerateGroupBackwardKeys]
0=Shift+Super+space

[Hotkey/ActivateKeys]
0=Hangul_Hanja

[Hotkey/DeactivateKeys]
0=Hangul_Romaja

[Hotkey/PrevPage]
0=Up

[Hotkey/NextPage]
0=Down

[Hotkey/PrevCandidate]
0=Shift+Tab

[Hotkey/NextCandidate]
0=Tab

[Hotkey/TogglePreedit]
0=Control+Alt+P

[Behavior]
ActiveByDefault=False
resetStateWhenFocusIn=No
ShareInputState=No
PreeditEnabledByDefault=True
ShowInputMethodInformation=True
showInputMethodInformationWhenFocusIn=False
CompactInputMethodInformation=True
ShowFirstInputMethodInformation=True
DefaultPageSize=5
OverrideXkbOption=False
CustomXkbOption=
EnabledAddons=
DisabledAddons=
PreloadInputMethod=True
AllowInputMethodForPassword=False
ShowPreeditForPassword=False
AutoSavePeriod=30
'';
}