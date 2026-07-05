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
    if variant ~= nil then
        require("lumin.config").setup({ variant = variant })
    end

    vim.cmd("highlight clear")

    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "lumin"

    set_highlights(require("lumin.highlights").get())
end

return M
