set fish_greeting # Disable greeting

function nswitch
    if test (count $argv) -eq 0
        set config "default"
    else
        set config $argv[1]
    end
    sudo nixos-rebuild switch --impure --flake /home/fp/nixos#$config
end