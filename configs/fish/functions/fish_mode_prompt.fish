function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold b8bb26;  printf '[Normal]'      # green
        case insert
            set_color --bold 83a598;  printf '[Insert]'      # blue
        case visual
            set_color --bold d3869b;  printf '[Visual]'      # purple
        case replace_one
            set_color --bold fb4934;  printf '[Replace]'     # red
        case '*'
            set_color --bold a89984;  printf '[?]'           # fg2
    end
    set_color normal
end
