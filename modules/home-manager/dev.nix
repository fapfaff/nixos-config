{ config, pkgs, lib, ... }:

let
  # Import submodules that specify packages and vscodeExtensions
  submodules = [
    ./dev/misc.nix
    ./dev/git.nix
    ./dev/python.nix
  ];

  importedModules = map (module: import module { inherit pkgs; }) submodules;

  allVsCodeExtensions = lib.concatLists (
    (map (module: module.vscodeExtensions) importedModules)
  );

  allPackages = lib.concatLists (
    (map (module: module.packages) importedModules)
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
