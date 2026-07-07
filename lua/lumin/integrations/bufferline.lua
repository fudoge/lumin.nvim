local common = require("lumin.integrations.common")

local M = {}

function M.get(variant, colors_override)
    local c
    variant, c = common.resolve(variant)

    local fill_bg = c.bg
    local inactive_bg = c.bg
    local selected_bg = c.bg
    local visible_bg = c.bg
    local separator_fg = fill_bg

    local default_colors = {
        fill = { fg = c.fg_muted, bg = fill_bg },
        background = { fg = c.fg_muted, bg = inactive_bg },
        buffer = { fg = c.fg_muted, bg = inactive_bg },

        tab = { fg = c.fg_muted, bg = inactive_bg },
        tab_selected = { fg = c.fg, bg = selected_bg },
        tab_separator = { fg = separator_fg, bg = inactive_bg },
        tab_separator_selected = { fg = separator_fg, bg = selected_bg, sp = separator_fg },
        tab_close = { fg = c.fg_muted, bg = inactive_bg },

        close_button = { fg = c.fg_muted, bg = inactive_bg },
        close_button_visible = { fg = c.fg_muted, bg = visible_bg },
        close_button_selected = { fg = c.fg_muted, bg = selected_bg },

        buffer_visible = { fg = c.fg_muted, bg = visible_bg },
        buffer_selected = { fg = c.fg, bg = selected_bg, bold = true },

        numbers = { fg = c.fg_subtle, bg = inactive_bg },
        numbers_visible = { fg = c.fg_muted, bg = visible_bg },
        numbers_selected = { fg = c.fg, bg = selected_bg, bold = true },

        diagnostic = { fg = c.fg_subtle, bg = inactive_bg },
        diagnostic_visible = { fg = c.fg_muted, bg = visible_bg },
        diagnostic_selected = { fg = c.fg, bg = selected_bg, bold = true },

        hint = { fg = c.hint, sp = c.hint, bg = inactive_bg },
        hint_visible = { fg = c.hint, bg = visible_bg },
        hint_selected = { fg = c.hint, bg = selected_bg, sp = c.hint, bold = true },
        hint_diagnostic = { fg = c.hint, sp = c.hint, bg = inactive_bg },
        hint_diagnostic_visible = { fg = c.hint, bg = visible_bg },
        hint_diagnostic_selected = { fg = c.hint, bg = selected_bg, sp = c.hint, bold = true },

        info = { fg = c.info, sp = c.info, bg = inactive_bg },
        info_visible = { fg = c.info, bg = visible_bg },
        info_selected = { fg = c.info, bg = selected_bg, sp = c.info, bold = true },
        info_diagnostic = { fg = c.info, sp = c.info, bg = inactive_bg },
        info_diagnostic_visible = { fg = c.info, bg = visible_bg },
        info_diagnostic_selected = { fg = c.info, bg = selected_bg, sp = c.info, bold = true },

        warning = { fg = c.yellow, sp = c.yellow, bg = inactive_bg },
        warning_visible = { fg = c.yellow, bg = visible_bg },
        warning_selected = { fg = c.yellow, bg = selected_bg, sp = c.yellow, bold = true },
        warning_diagnostic = { fg = c.yellow, sp = c.yellow, bg = inactive_bg },
        warning_diagnostic_visible = { fg = c.yellow, bg = visible_bg },
        warning_diagnostic_selected = { fg = c.yellow, bg = selected_bg, sp = c.yellow, bold = true },

        error = { fg = c.red, bg = inactive_bg, sp = c.red },
        error_visible = { fg = c.red, bg = visible_bg },
        error_selected = { fg = c.red, bg = selected_bg, sp = c.red, bold = true },
        error_diagnostic = { fg = c.red, bg = inactive_bg, sp = c.red },
        error_diagnostic_visible = { fg = c.red, bg = visible_bg },
        error_diagnostic_selected = { fg = c.red, bg = selected_bg, sp = c.red, bold = true },

        modified = { fg = c.accent, bg = inactive_bg },
        modified_visible = { fg = c.accent, bg = visible_bg },
        modified_selected = { fg = c.accent, bg = selected_bg },

        duplicate = { fg = c.fg_dark, bg = inactive_bg, italic = true },
        duplicate_visible = { fg = c.fg_subtle, bg = visible_bg, italic = true },
        duplicate_selected = { fg = c.fg_muted, bg = selected_bg, italic = true },

        separator = { fg = separator_fg, bg = inactive_bg },
        separator_visible = { fg = separator_fg, bg = visible_bg },
        separator_selected = { fg = separator_fg, bg = selected_bg },

        indicator_visible = { fg = c.accent, bg = visible_bg },
        indicator_selected = { fg = c.accent, bg = selected_bg },

        pick = { fg = c.accent, bg = inactive_bg, bold = true },
        pick_visible = { fg = c.accent, bg = visible_bg, bold = true },
        pick_selected = { fg = c.accent, bg = selected_bg, bold = true },

        offset_separator = { fg = c.border, bg = inactive_bg },
        trunc_marker = { fg = c.fg_subtle, bg = inactive_bg },
    }

    return common.extend("bufferline", default_colors, c, variant, colors_override)
end

return setmetatable(M, {
    __call = function(_, variant, colors_override)
        return M.get(variant, colors_override)
    end,
})
