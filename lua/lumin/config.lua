local M = {}

M.defaults = {
    variant = "regular",
    blur_bg = "NONE",
    blur_blend_bg = "#101010",
    integrations = {},
}

M.options = vim.deepcopy(M.defaults)
M.active_variant = M.defaults.variant
M.has_configured_variant = false

local function normalize_variant(variant)
    if variant ~= "regular" and variant ~= "light" and variant ~= "blur" then
        return M.defaults.variant
    end

    return variant
end

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
    M.has_configured_variant = opts ~= nil and opts.variant ~= nil

    if M.has_configured_variant then
        M.active_variant = normalize_variant(M.options.variant)
    end
end

function M.set_variant(variant)
    if variant ~= nil then
        M.options.variant = normalize_variant(variant)
        M.has_configured_variant = true
    end
end

function M.get_variant(variant)
    return normalize_variant(variant or M.active_variant or M.defaults.variant)
end

function M.resolve_load_variant(variant)
    if variant ~= nil then
        return normalize_variant(variant)
    end

    if M.has_configured_variant then
        return normalize_variant(M.options.variant)
    end

    return M.defaults.variant
end

function M.set_active_variant(variant)
    M.active_variant = normalize_variant(variant)
end

function M.get_colors_name(variant)
    variant = M.get_variant(variant)

    if variant == "regular" then
        return "lumin"
    end

    return "lumin-" .. variant
end

return M
