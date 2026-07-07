local common = require("lumin.integrations.common")

local M = {}

function M.get(variant, colors_override)
    local c
    variant, c = common.resolve(variant)

    local popup_bg = variant == "blur" and c.bg or c.float
    local split_bg = variant == "blur" and c.bg or c.surface

    local default_colors = {
        NoiceCmdline = { fg = c.fg, bg = popup_bg },
        NoiceCmdlineIcon = { fg = c.accent },
        NoiceCmdlineIconSearch = { fg = c.yellow },
        NoiceCmdlinePopup = { fg = c.fg, bg = popup_bg },
        NoiceCmdlinePopupBorder = { fg = c.border_active, bg = popup_bg },
        NoiceCmdlinePopupBorderSearch = { fg = c.yellow, bg = popup_bg },
        NoiceCmdlinePopupTitle = { fg = c.accent, bg = popup_bg, bold = true },
        NoiceConfirm = { fg = c.fg, bg = popup_bg },
        NoiceConfirmBorder = { fg = c.green, bg = popup_bg },
        NoiceFormatDate = { fg = c.fg_subtle },
        NoiceFormatEvent = { fg = c.accent },
        NoiceFormatKind = { fg = c.type_builtin },
        NoiceFormatLevelDebug = { fg = c.fg_subtle },
        NoiceFormatLevelError = { fg = c.red },
        NoiceFormatLevelInfo = { fg = c.info },
        NoiceFormatLevelOff = { fg = c.fg_dark },
        NoiceFormatLevelTrace = { fg = c.fg_dark },
        NoiceFormatLevelWarn = { fg = c.yellow },
        NoiceMini = { fg = c.fg_muted, bg = c.bg, blend = 0 },
        NoiceLspProgressClient = { fg = c.fg_muted },
        NoiceLspProgressSpinner = { fg = c.accent },
        NoiceLspProgressTitle = { fg = c.fg },
        NoicePopup = { fg = c.fg, bg = popup_bg },
        NoicePopupBorder = { fg = c.border, bg = popup_bg },
        NoicePopupmenu = { fg = c.fg, bg = popup_bg },
        NoicePopupmenuBorder = { fg = c.border, bg = popup_bg },
        NoicePopupmenuMatch = { fg = c.accent, bg = popup_bg, bold = true },
        NoicePopupmenuSelected = { fg = c.blend_bg, bg = c.accent },
        NoiceScrollbar = { bg = c.element },
        NoiceScrollbarThumb = { bg = c.element_hover },
        NoiceSplit = { fg = c.fg, bg = split_bg },
        NoiceSplitBorder = { fg = c.border, bg = split_bg },
        NoiceVirtualText = { fg = c.fg_muted },
        NoiceFormatProgressDone = {
            fg = c.blend_bg,
            bg = c.accent,
        },
        NoiceFormatProgressTodo = {
            fg = c.fg_subtle,
            bg = c.element,
        },
    }

    return common.extend("noice", default_colors, c, variant, colors_override)
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
