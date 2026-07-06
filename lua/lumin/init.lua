local M = {}

function M.setup(opts)
    require("lumin.config").setup(opts)
end

local function set_highlights(highlights)
    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

function M.load(variant)
    local config = require("lumin.config")
    local active_variant = config.resolve_load_variant(variant)

    config.set_active_variant(active_variant)

    vim.o.termguicolors = true
    vim.g.colors_name = config.get_colors_name(active_variant)

    set_highlights(require("lumin.highlights").get(active_variant))
end

return M
