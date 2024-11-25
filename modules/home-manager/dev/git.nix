{ pkgs, ... }:

{

  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    userName = "Fabian Pfaff";
    userEmail = "fabian-pfaff@outlook.de";
  };

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    waderyan.gitblame
    donjayamanne.githistory
    codezombiech.gitignore

    # CI/CD
    github.vscode-github-actions
    gitlab.gitlab-workflow
  ];
}
