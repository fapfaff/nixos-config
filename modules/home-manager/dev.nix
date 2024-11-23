{ config, pkgs, lib, ... }:

{
  imports = [
    ./dev/misc.nix
    ./dev/git.nix
    ./dev/python.nix
    ./dev/frontend.nix
  ]

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
  };
}
