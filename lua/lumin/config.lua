local M = {}

M.defaults = {
    variant = "blur",
}

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
