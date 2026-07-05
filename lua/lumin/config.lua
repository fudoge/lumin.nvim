local M = {}

M.defaults = {
    variant = "regular",
    blur_bg = "NONE",
    blur_blend_bg = "#101010",
    integrations = {},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

function M.set_variant(variant)
    if variant ~= nil then
        M.options.variant = variant
    end
end

function M.get_variant(variant)
    variant = variant or M.options.variant or M.defaults.variant

    if variant ~= "regular" and variant ~= "light" and variant ~= "blur" then
        return M.defaults.variant
    end

    return variant
end

function M.get_colors_name(variant)
    variant = M.get_variant(variant)

    if variant == "regular" then
        return "lumin"
    end

    return "lumin-" .. variant
end

return M
