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
    M.options.variant = variant
end

return M
