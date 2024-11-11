{ config, pkgs, lib, ... }:

let
  python = import ./dev.python.nix { inherit pkgs; };

  commonExtensions = with pkgs.vscode-extensions; [
    ms-azuretools.vscode-docker
  ];

  allVsCodeExtensions = lib.concatLists [
    commonExtensions
    # Import from other modules
    python.vscodeExtensions
  ];

  commonPackages = with pkgs; [
    docker

    (vscode-with-extensions.override {
      vscodeExtensions = allVsCodeExtensions;
    })
  ];

  allPackages = lib.concatLists [
    commonPackages
    python.nixPackages
  ];

in
{
  home.packages = allPackages; 
}
