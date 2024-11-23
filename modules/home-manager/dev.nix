{ config, pkgs, lib, ... }:

{
  imports = [
    ./dev/misc.nix
    ./dev/git.nix
    ./dev/python.nix
    ./dev/frontend.nix
  ];

  home.packages = with pkgs; [
        (jetbrains.plugins.addPlugins jetbrains.idea-ultimate ["github-copilot"])   
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
  };
}
