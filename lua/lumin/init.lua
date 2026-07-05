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

    if variant ~= nil then
        config.set_variant(variant)
    end

    vim.cmd("highlight clear")

    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = config.options.variant == "regular" and "lumin" or "lumin-" .. config.options.variant

    set_highlights(require("lumin.highlights").get())
end

return M
