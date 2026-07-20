{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jdk21
  ];

  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    redhat.java
    vscjava.vscode-java-pack
  ];
}