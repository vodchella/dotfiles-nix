function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold 98c379;  printf '[Normal]'
        case insert
            set_color --bold 61afef;  printf '[Insert]'
        case visual
            set_color --bold c678dd;  printf '[Visual]'
        case replace_one
            set_color --bold e06c75;  printf '[Replace]'
        case '*'
            set_color --bold a0a0a0;  printf '[?]'
    end
    set_color normal
end
