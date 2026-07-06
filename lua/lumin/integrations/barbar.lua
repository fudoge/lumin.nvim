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

    local default_colors = {
        BufferCurrent = { fg = c.fg, bg = c.bg, bold = true },
        BufferCurrentIndex = { fg = c.fg_muted, bg = c.bg },
        BufferCurrentMod = { fg = c.accent, bg = c.bg },
        BufferCurrentSign = { fg = c.accent, bg = c.bg },
        BufferCurrentSignRight = { fg = c.bg, bg = c.bg },
        BufferCurrentTarget = { fg = c.red, bg = c.bg, bold = true },
        BufferCurrentIcon = { fg = c.type_builtin, bg = c.bg },
        BufferCurrentPin = { fg = c.accent, bg = c.bg },
        BufferCurrentERROR = { fg = c.red, bg = c.bg, sp = c.red },
        BufferCurrentWARN = { fg = c.yellow, bg = c.bg, sp = c.yellow },
        BufferCurrentINFO = { fg = c.info, bg = c.bg, sp = c.info },
        BufferCurrentHINT = { fg = c.hint, bg = c.bg, sp = c.hint },

        BufferVisible = { fg = c.fg_muted, bg = c.bg },
        BufferVisibleIndex = { fg = c.fg_subtle, bg = c.bg },
        BufferVisibleMod = { fg = c.accent, bg = c.bg },
        BufferVisibleSign = { fg = c.bg, bg = c.bg },
        BufferVisibleSignRight = { fg = c.bg, bg = c.bg },
        BufferVisibleTarget = { fg = c.red, bg = c.bg, bold = true },
        BufferVisibleIcon = { fg = c.type_builtin, bg = c.bg },
        BufferVisiblePin = { fg = c.accent, bg = c.bg },
        BufferVisibleERROR = { fg = c.red, bg = c.bg, sp = c.red },
        BufferVisibleWARN = { fg = c.yellow, bg = c.bg, sp = c.yellow },
        BufferVisibleINFO = { fg = c.info, bg = c.bg, sp = c.info },
        BufferVisibleHINT = { fg = c.hint, bg = c.bg, sp = c.hint },

        BufferInactive = { fg = c.fg_muted, bg = c.bg },
        BufferInactiveIndex = { fg = c.fg_subtle, bg = c.bg },
        BufferInactiveMod = { fg = c.accent, bg = c.bg },
        BufferInactiveSign = { fg = c.bg, bg = c.bg },
        BufferInactiveSignRight = { fg = c.bg, bg = c.bg },
        BufferInactiveTarget = { fg = c.red, bg = c.bg, bold = true },
        BufferInactiveIcon = { fg = c.fg_subtle, bg = c.bg },
        BufferInactivePin = { fg = c.fg_subtle, bg = c.bg },
        BufferInactiveERROR = { fg = c.red, bg = c.bg, sp = c.red },
        BufferInactiveWARN = { fg = c.yellow, bg = c.bg, sp = c.yellow },
        BufferInactiveINFO = { fg = c.info, bg = c.bg, sp = c.info },
        BufferInactiveHINT = { fg = c.hint, bg = c.bg, sp = c.hint },

        BufferTabpageFill = { fg = c.fg_muted, bg = c.bg },
        BufferTabpages = { fg = c.fg_muted, bg = c.bg },
        BufferOffset = { fg = c.fg_muted, bg = c.bg },
        BufferScrollArrow = { fg = c.fg_subtle, bg = c.bg },
    }

    local integrations = config.options.integrations or {}
    local barbar = colors_override or integrations.barbar
    if is_scoped_override(barbar, variant) then
        return vim.tbl_deep_extend(
            "force",
            default_colors,
            get_colors(barbar.all, c),
            get_colors(barbar[variant], c)
        )
    end

    if barbar then
        return vim.tbl_deep_extend("force", default_colors, get_colors(barbar, c))
    end

    return default_colors
end

function M.apply(variant, colors_override)
    for group, opts in pairs(M.get(variant, colors_override)) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return setmetatable(M, {
    __call = function(_, variant, colors_override)
        return M.get(variant, colors_override)
    end,
})
