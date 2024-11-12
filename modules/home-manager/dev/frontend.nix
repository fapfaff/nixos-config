{ pkgs, ... }:

{

  packages = with pkgs; [
    nodejs
    deno
    pnpm
  ];

  vscodeExtensions = with pkgs.vscode-extensions; [
    # HTML
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
#    bradgashler.htmltagwrap

    # Javascript
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
#    Orta.vscode-jest
    
    # CSS
    bradlc.vscode-tailwindcss
#    mrmlnc.vscode-scss
    # HTML

    # Vue
#    Vue.volar

    # Nuxt
#    Nuxtr.nuxtr-vscode
#    Nuxtr.nuxt-vscode-extentions
  ];
}
