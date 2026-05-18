function __update_cwd --on-variable PWD
    printf '\e]7;file://%s%s\e\\' $hostname $PWD
end
