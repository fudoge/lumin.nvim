local common = require("lumin.integrations.common")

local M = {}

function M.get(variant, colors_override)
    local c
    variant, c = common.resolve(variant)

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

    return common.extend("barbar", default_colors, c, variant, colors_override)
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
