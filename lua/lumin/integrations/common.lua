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

local function is_scoped_override(colors_override, variant)
    return type(colors_override) == "table" and (colors_override.all ~= nil or colors_override[variant] ~= nil)
end

function M.resolve(variant)
    variant = config.get_variant(variant)

    return variant, palette[variant] or palette.regular
end

function M.extend(integration_name, default_colors, colors, variant, colors_override)
    local integrations = config.options.integrations or {}
    local integration = colors_override or integrations[integration_name]

    if is_scoped_override(integration, variant) then
        return vim.tbl_deep_extend(
            "force",
            default_colors,
            get_colors(integration.all, colors),
            get_colors(integration[variant], colors)
        )
    end

    if integration then
        return vim.tbl_deep_extend("force", default_colors, get_colors(integration, colors))
    end

    return default_colors
end

return M
