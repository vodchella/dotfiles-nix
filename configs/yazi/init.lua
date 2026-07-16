local YELLOW = '#d79921'
local DARK   = '#282828'
local GRAY   = '#504945'
local LIGHT  = '#ebdbb2'
local GREEN  = '#b8bb26'
local RED    = '#fb4934'

local function tmux_style(
    text,
    fg,
    bg,
    attrs
)
    local style = {
        'fg=' .. fg,
        'bg=' .. bg,
    }

    if attrs then
        style[#style + 1] = attrs
    end

    return string.format(
        '#[%s]%s',
        table.concat(style, ','),
        text
    )
end

local function tmux_reset(text)
    return '#[default]' .. text
end

local function escape_tmux(text)
    return tostring(text):gsub('#', '##')
end

local function mode_name(status)
    return tostring(status._tab.mode)
        :sub(1, 3)
        :upper()
end

local function mode_colors(status)
    local mode = status._tab.mode

    if mode.is_select then
        return '#fe8019', GRAY
    elseif mode.is_unset then
        return GREEN, GRAY
    else
        return YELLOW, GRAY
    end
end

local function build_left(status)
    local hovered = status._current.hovered
    local main_bg, alt_bg = mode_colors(status)

    local size = 0
    local name = ''

    if hovered then
        size = hovered.cha.len or 0
        name = escape_tmux(hovered.name)
    end

    return table.concat({
        tmux_style(
            ' ' .. mode_name(status) .. ' ',
            DARK,
            main_bg,
            'bold'
        ),

        tmux_style(
            '',
            main_bg,
            alt_bg
        ),

        tmux_style(
            ' ' .. ya.readable_size(size):gsub(' ', '') .. ' ',
            LIGHT,
            alt_bg
        ),

        tmux_style(
            '',
            alt_bg,
            'default'
        ),

        tmux_reset(
            ' ' .. name
        ),
    })
end

local function permission_color(char)
    if char == 'r' then
        return GREEN
    elseif char == 'w' then
        return RED
    elseif char == 'x'
        or char == 's'
        or char == 'S'
        or char == 't'
        or char == 'T'
    then
        return YELLOW
    elseif char == '-' or char == '?' then
        return GRAY
    else
        return LIGHT
    end
end

local function build_permissions(status)
    local hovered = status._current.hovered

    if not hovered then
        return ''
    end

    local permissions = hovered.cha:perm()

    if not permissions then
        return ''
    end

    local result = {}

    for i = 1, #permissions do
        local char = permissions:sub(i, i)

        result[#result + 1] = tmux_style(
            char,
            permission_color(char),
            'default'
        )
    end

    return table.concat(result)
end

local function build_right(status)
    local cursor = status._current.cursor
    local total = #status._current.files

    local index = math.min(cursor + 1, total)
    local percent

    if total == 0 or cursor == 0 then
        percent = 'Top'
    else
        local value = math.floor((cursor + 1) * 100 / total)

        if value >= 100 then
            percent = 'Bot'
        else
            percent = string.format('%d%%', value)
        end
    end

    local permissions = build_permissions(status)

    if permissions ~= '' then
        permissions = permissions .. ' '
    end

    return table.concat({
        tmux_reset(' '),

        permissions,

        tmux_style(
            '',
            GRAY,
            'default'
        ),

        tmux_style(
            ' ' .. percent .. ' ',
            LIGHT,
            GRAY
        ),

        tmux_style(
            '',
            YELLOW,
            GRAY
        ),

        tmux_style(
            string.format(
                ' %d/%d ',
                index,
                total
            ),
            DARK,
            YELLOW,
            'bold'
        ),
    })
end

local function set_tmux_variable(
    name,
    value
)
    Command('tmux')
        :arg({
            'set-option',
            '-q',
            name,
            value,
        })
        :spawn()
end

local last_left
local last_right

local function update_tmux(status)
    if not os.getenv('TMUX') then
        return
    end

    local left = build_left(status)
    local right = build_right(status)

    if left ~= last_left then
        last_left = left
        set_tmux_variable('@yazi_left', left)
    end

    if right ~= last_right then
        last_right = right
        set_tmux_variable('@yazi_right', right)
    end
end

Status:children_add(function(status)
    update_tmux(status)

    return ''
end, 5000, Status.LEFT)

local ok, no_status = pcall(require, 'no-status')
if ok then
    no_status:setup()
end
