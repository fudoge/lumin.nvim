local config = require("lumin.config")
local palette = require("lumin.palette")

local M = {}

local function get_colors(colors_override, colors)
    if colors_override == nil then
        return {}
    elseif type(colors_override) == "function" then
        return colors_override(colors)
    else
        return colors_override
    end
end

local function get_variant(variant)
    return config.get_variant(variant)
end

local function is_scoped_override(colors_override, variant)
    return type(colors_override) == "table" and (colors_override.all ~= nil or colors_override[variant] ~= nil)
end

function M.get(variant, colors_override)
    variant = get_variant(variant)

    local c = palette[variant]
    if c == nil then
        c = palette.regular
    end

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

    local integrations = config.options.integrations or {}
    local lualine = colors_override or integrations.lualine
    if is_scoped_override(lualine, variant) then
        return vim.tbl_deep_extend(
            "force",
            default_colors,
            get_colors(lualine.all, c),
            get_colors(lualine[variant], c)
        )
    end

    if lualine then
        return vim.tbl_deep_extend("force", default_colors, get_colors(lualine, c))
    end

    return default_colors
end

return setmetatable(M, {
    __call = function(_, variant, colors_override)
        return M.get(variant, colors_override)
    end,
})
