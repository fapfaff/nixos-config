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
  ];


  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -la";
    };
    interactiveShellInit = builtins.readFile ./shell/init.fish;

  };
  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}

