{ pkgs, ... }:

{

  home.packages = with pkgs; [
    insomnia
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    
    # Nix
    bbenoist.nix

    # Virtualisation
    ms-azuretools.vscode-docker
    ms-vscode-remote.remote-containers

    # Github Copilot
	  github.copilot
    github.copilot-chat
  ];
}
