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
  };
  programs.zoxide = {
    enable = true;
  };
}

