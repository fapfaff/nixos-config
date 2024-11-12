{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    fzf
    grc

    fishPlugins.grc
    fishPlugins.fzf-fish
    fishPlugins.foreign-env
    fishPlugins.done
    fishPlugins.forgit    
    fishPlugins.hydro
  ];


  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -la";
    };
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
  programs.zoxide = {
    enable = true;
  };
}

