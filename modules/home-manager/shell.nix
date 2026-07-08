{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    fzf
    grc
    ripgrep
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    shellAliases = {
      ls = "eza";
      ll = "eza -la";
    };

    initContent = ''
      nswitch() {
        local config="''${1:-default}"
        sudo nixos-rebuild switch --impure --flake "/home/fp/nixos#$config"
      }

      bx() {
        bash -lc "$*"
      }
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}