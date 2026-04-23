{ pkgs, ... }:

{

  home.packages = with pkgs; [
    insomnia
  ];

  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [

    # Nix
    bbenoist.nix
    jnoortheen.nix-ide

    # Virtualisation
    ms-azuretools.vscode-docker
    ms-vscode-remote.remote-containers
  ];
}
