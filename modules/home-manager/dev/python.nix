{ pkgs, ... }:

{

  packages = with pkgs; [
    python3
  ];

  vscodeExtensions = with pkgs.vscode-extensions; [
        ms-python.python
	ms-python.vscode-pylance
	ms-python.pylint
	ms-python.debugpy
	ms-python.black-formatter
	ms-python.isort
        ms-toolsai.jupyter
	ms-toolsai.jupyter-keymap
        ms-toolsai.vscode-jupyter-cell-tags
	ms-toolsai.jupyter-renderers
	ms-toolsai.vscode-jupyter-slideshow
        ms-toolsai.datawrangler
#	njpwerner.autodocstring
#	pamaron.pytest-runner
#       njqdev.vscode-python-typehint
  ];
}
