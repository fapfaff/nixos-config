{ config, pkgs, lib, ... }:

let
  # Import submodules that specify packages and vscodeExtensions
  submodules = [
     ./dev/python.nix
  ];

  # Common vscodeExtensions
  commonExtensions = with pkgs.vscode-extensions; [
    ms-azuretools.vscode-docker
    bbenoist.nix
  ];

  # Common packages
  commonPackages = with pkgs; [
    docker
  ];

  importedModules = map (module: import module { inherit pkgs; }) submodules;

  allVsCodeExtensions = lib.concatLists (
    [ commonExtensions ] ++ (map (module: module.vscodeExtensions) importedModules)
  );

  allPackages = lib.concatLists (
    [ commonPackages ] ++ (map (module: module.packages) importedModules)
  );

in
{
  home.packages = allPackages; 

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    extensions = allVsCodeExtensions;
  };
}
