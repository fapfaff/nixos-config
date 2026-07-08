{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    fzf
    grc
    ripgrep

    fishPlugins.grc
    fishPlugins.fzf-fish
    fishPlugins.foreign-env
    fishPlugins.done
    fishPlugins.forgit
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -la";
    };
    interactiveShellInit = builtins.readFile ./init.fish;

    functions = {
      envsource = ''
            for line in (grep -v '^\s*#' $argv | grep -v '^\s*$')
              set item (string split -m 1 '=' $line)
              set key (string trim $item[1])
              set value (string trim --chars='"' (string trim $item[2]))

              if string match -qr '^[A-Za-z_][A-Za-z0-9_]*$' -- $key
                  set -gx $key $value
                  echo "Exported key $key"
              else
                  echo "Skipped invalid key: $key"
              end
          end
        '';
    };
  };

  programs.starship.enable = true;

  programs.zoxide.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}