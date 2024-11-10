{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
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

