{ pkgs, ... }:

{

  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Fabian Pfaff";
        email = "fabian-pfaff@outlook.de";
      };
    };
  };

  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    waderyan.gitblame
    donjayamanne.githistory
    codezombiech.gitignore

    # CI/CD
    github.vscode-github-actions
    gitlab.gitlab-workflow
  ];
}
