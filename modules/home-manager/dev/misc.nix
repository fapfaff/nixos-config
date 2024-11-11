{ pkgs, ... }:

{

  packages = with pkgs; [
  ];

  vscodeExtensions = with pkgs.vscode-extensions; [
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
