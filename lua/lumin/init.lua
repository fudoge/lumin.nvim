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

    config.set_variant(variant)

    vim.o.termguicolors = true
    vim.g.colors_name = config.get_colors_name()

    set_highlights(require("lumin.highlights").get())
end

return M
