{ pkgs, ... }:

{

  packages = with pkgs; [
    gh
  ];

  vscodeExtensions = with pkgs.vscode-extensions; [
    waderyan.gitblame
    donjayamanne.githistory
    codezombiech.gitignore

    # CI/CD
    github.vscode-github-actions
    gitlab.gitlab-workflow
  ];
}
