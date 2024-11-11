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
  _ = builtins.trace "All VS Code Extensions:" allVsCodeExtensions;

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
