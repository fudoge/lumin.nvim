local utils = require("lumin.utils.colors")
local config = require("lumin.config")

local function build_blur()
    local blur_bg = config.options.blur_bg
    local blur_blend_bg = config.options.blur_blend_bg

    return {
        -- base
        bg = blur_bg,
        blend_bg = blur_blend_bg,
        surface = blur_bg,
        surface_blend = blur_blend_bg,
        float = "#161616",

        -- foreground
        fg = "#FFFFFF",
        fg_muted = "#A0A0A0",
        fg_subtle = "#7E7E7E",
        fg_dark = "#505050",

        -- accent
        accent = "#FFC799",
        accent_hover = "#FFCFA8",

        -- ui
        element = "#1C1C1C",
        element_hover = "#282828",
        element_selected = utils.rgba_to_rgb("#FFC79922", blur_blend_bg),
        drop_target = utils.rgba_to_rgb("#FFC79950", blur_blend_bg),

        border = "#282828",
        border_active = "#FFC799",

        cursor = "#FFC799",
        selection = utils.rgba_to_rgb("#FFFFFF25", blur_blend_bg),
        search = utils.rgba_to_rgb("#FFFFFF25", blur_blend_bg),
        search_active = utils.rgba_to_rgb("#FFC79950", blur_blend_bg),

        cursorline = utils.rgba_to_rgb("#FFFFFF10", blur_blend_bg),
        doc_highlight = utils.rgba_to_rgb("#FFFFFF15", blur_blend_bg),

        line_nr = "#505050",
        line_nr_active = "#FFFFFF",
        invisible = "#505050",
        guide = "#282828",
        guide_active = "#505050",

        -- diagnostics / git
        red = "#FF8080",
        red_bg = "#2A1515",
        green = "#99FFE4",
        green_bg = utils.rgba_to_rgb("#99FFE415", blur_blend_bg),
        yellow = "#FFC799",
        yellow_bg = "#2A1F15",

        info = "#A0A0A0",
        info_bg = "#1C1C1C",
        hint = "#A0A0A0",
        hint_bg = "#1C1C1C",

        -- syntax
        syntax_fg = "#D6D6DD",
        comment = "#8A8A8A",
        attribute = "#AAA0FA",
        boolean = "#D6D6DD",
        constant = "#D6D6DD",
        constructor = "#D6D6DD",
        embedded = "#D6D6DD",
        emphasis = "#83D6C5",
        strong = "#F8C762",
        enum = "#EFB080",
        func = "#EFB080",
        keyword = "#83D6C5",
        label = "#D6D6DD",
        link = "#81A1C1",
        link_uri = "#88C0D0",
        number = "#EBC88D",
        operator = "#83D6C5",
        predictive = "#D8DEE9",
        preproc = "#A8CC7C",
        property = "#81D2CE",
        punctuation = "#D6D6DD",
        bracket = "#FFD602",
        string = "#E394DC",
        string_escape = "#D6D6DD",
        string_regex = "#F8C762",
        tag = "#FAD075",
        title = "#D6D6DD",
        type = "#87C3FF",
        type_builtin = "#81D2CE",
        variable = "#D6D6DD",
        parameter = "#F8C762",
        variable_special = "#C1808A",
    }
end

local function dynamic_blur()
    return setmetatable({}, {
        __index = function(_, key)
            return build_blur()[key]
        end,
        __pairs = function()
            return pairs(build_blur())
        end,
    })
end

return {
    regular = {
        -- base
        bg = "#101010",
        blend_bg = "#101010",
        surface = "#101010",
        surface_blend = "#101010",
        float = "#161616",

        -- foreground
        fg = "#FFFFFF",
        fg_muted = "#A0A0A0",
        fg_subtle = "#7E7E7E",
        fg_dark = "#505050",

        -- accent
        accent = "#FFC799",
        accent_hover = "#FFCFA8",

        -- ui
        element = "#1C1C1C",
        element_hover = "#282828",
        element_selected = "#302822", -- #FFC79922 over #101010
        drop_target = "#5B493B",      -- #FFC79950 over #101010

        border = "#282828",
        border_active = "#FFC799",

        cursor = "#FFC799",
        selection = "#333333",     -- #FFFFFF25 over #101010
        search = "#333333",        -- #FFFFFF25 over #101010
        search_active = "#5B493B", -- #FFC79950 over #101010

        cursorline = "#1F1F1F",    -- #FFFFFF10 over #101010
        doc_highlight = "#242424", -- #FFFFFF15 over #101010

        line_nr = "#505050",
        line_nr_active = "#FFFFFF",
        invisible = "#505050",
        guide = "#282828",
        guide_active = "#505050",

        -- diagnostics / git
        red = "#FF8080",
        red_bg = "#2A1515",
        green = "#99FFE4",
        green_bg = "#1B2421", -- #99FFE415 over #101010
        yellow = "#FFC799",
        yellow_bg = "#2A1F15",

        info = "#A0A0A0",
        info_bg = "#1C1C1C",
        hint = "#A0A0A0",
        hint_bg = "#1C1C1C",

        -- syntax
        syntax_fg = "#D6D6DD",
        comment = "#8A8A8A",
        attribute = "#AAA0FA",
        boolean = "#D6D6DD",
        constant = "#D6D6DD",
        constructor = "#D6D6DD",
        embedded = "#D6D6DD",
        emphasis = "#83D6C5",
        strong = "#F8C762",
        enum = "#EFB080",
        func = "#EFB080",
        keyword = "#83D6C5",
        label = "#D6D6DD",
        link = "#81A1C1",
        link_uri = "#88C0D0",
        number = "#EBC88D",
        operator = "#83D6C5",
        predictive = "#D8DEE9",
        preproc = "#A8CC7C",
        property = "#81D2CE",
        punctuation = "#D6D6DD",
        bracket = "#FFD602",
        string = "#E394DC",
        string_escape = "#D6D6DD",
        string_regex = "#F8C762",
        tag = "#FAD075",
        title = "#D6D6DD",
        type = "#87C3FF",
        type_builtin = "#81D2CE",
        variable = "#D6D6DD",
        parameter = "#F8C762",
        variable_special = "#C1808A",
    },

    blur = dynamic_blur(),

    light = {
        -- base
        bg = "#F7F7F4",
        blend_bg = "#F7F7F4",
        surface = "#EFEFED",
        surface_blend = "#EFEFED",
        float = "#ECECEA",

        -- foreground
        fg = "#242424",
        fg_muted = "#686868",
        fg_subtle = "#929292",
        fg_dark = "#B8B8B4",

        -- accent
        accent = "#B96F3D",
        accent_hover = "#9F5F34",

        -- ui
        element = "#E8E8E4",
        element_hover = "#DEDEDA",
        element_selected = "#EDE4DD",
        drop_target = "#EBD7C7",

        border = "#D8D8D3",
        border_active = "#B96F3D",

        cursor = "#B96F3D",
        selection = "#EBD7C7",
        search = "#D7D7D2",
        search_active = "#E6C7AE",

        cursorline = "#ECECEA",
        doc_highlight = "#E5E5E1",

        line_nr = "#ADADA8",
        line_nr_active = "#50504C",
        invisible = "#B8B8B4",
        guide = "#D8D8D3",
        guide_active = "#B8B8B4",

        -- diagnostics / git
        red = "#C45A5A",
        red_bg = "#F2E1DF",
        green = "#2F8F78",
        green_bg = "#DFECE8",
        yellow = "#B96F3D",
        yellow_bg = "#F0E4DA",

        info = "#686868",
        info_bg = "#ECECEA",
        hint = "#686868",
        hint_bg = "#ECECEA",

        -- syntax
        syntax_fg = "#3D3D3A",
        comment = "#7E7E78",
        attribute = "#6F63B6",
        boolean = "#3D3D3A",
        constant = "#3D3D3A",
        constructor = "#3D3D3A",
        embedded = "#3D3D3A",
        emphasis = "#268A78",
        strong = "#A97A24",
        enum = "#B8754A",
        func = "#B8754A",
        keyword = "#268A78",
        label = "#3D3D3A",
        link = "#3E6F9F",
        link_uri = "#4B8793",
        number = "#9D7927",
        operator = "#268A78",
        predictive = "#929292",
        preproc = "#5E8441",
        property = "#2F847C",
        punctuation = "#5A5A55",
        bracket = "#9B8300",
        string = "#9B4D92",
        string_escape = "#5A5A55",
        string_regex = "#A97A24",
        tag = "#907B00",
        title = "#343431",
        type = "#3E6F9F",
        type_builtin = "#2F847C",
        variable = "#343431",
        parameter = "#A97A24",
        variable_special = "#8F4A58",
    },
}
