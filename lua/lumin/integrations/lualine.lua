local common = require("lumin.integrations.common")

local M = {}

function M.get(variant, colors_override)
    local c
    variant, c = common.resolve(variant)

    local bar_bg = c.surface == "NONE" and "NONE" or c.element
    local inactive_bg = c.surface == "NONE" and "NONE" or c.surface

    local function mode(section_color)
        return {
            a = { bg = section_color, fg = c.blend_bg, gui = "bold" },
            b = { bg = c.element_hover, fg = section_color },
            c = { bg = bar_bg, fg = c.fg_muted },
        }
    end

    local default_colors = {
        normal = mode(c.accent),
        insert = mode(c.green),
        terminal = mode(c.green),
        command = mode(c.yellow),
        visual = mode(c.attribute),
        replace = mode(c.red),

        inactive = {
            a = { bg = inactive_bg, fg = c.fg_subtle },
            b = { bg = inactive_bg, fg = c.fg_subtle, gui = "bold" },
            c = { bg = inactive_bg, fg = c.fg_dark },
        },
    }

    return common.extend("lualine", default_colors, c, variant, colors_override)
end

return setmetatable(M, {
    __call = function(_, variant, colors_override)
        return M.get(variant, colors_override)
    end,
})
