{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    pkgs.fishPlugins.foreign-env
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -la";
    };
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
  programs.zoxide = {
    enable = true;
  };
}

