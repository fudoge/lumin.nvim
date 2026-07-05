local config = require("lumin.config")
local palette = require("lumin.palette")

local M = {}

function M.get()
    local variant = config.options.variant or "blur"
    local c = palette[variant]

    return {

        -- Base
        Normal = { fg = c.fg, bg = c.bg },
        NormalNC = { fg = c.fg, bg = c.bg },
        NormalFloat = { fg = c.fg, bg = c.float },
        FloatBorder = { fg = c.border, bg = c.float },
        FloatTitle = { fg = c.accent, bg = c.float },

        -- Cursor / selection
        Cursor = { fg = c.blend_bg, bg = c.cursor },
        CursorLine = { bg = c.cursorline },
        CursorLineNr = { fg = c.line_nr_active },
        Visual = { bg = c.selection },

        -- Lines / gutter
        LineNr = { fg = c.line_nr },
        SignColumn = { bg = c.bg },
        FoldColumn = { fg = c.fg_dark, bg = c.bg },
        ColorColumn = { bg = c.element },
        VertSplit = { fg = c.border },
        WinSeparator = { fg = c.border },
        Directory = { fg = c.type_builtin },
        NonText = { fg = c.fg_dark },
        EndOfBuffer = { fg = c.fg_dark },
        Conceal = { fg = c.fg_subtle },

        -- Search
        Search = { fg = c.fg, bg = c.search },
        IncSearch = { fg = c.blend_bg, bg = c.search_active },
        CurSearch = { fg = c.blend_bg, bg = c.search_active },

        -- Basic syntax
        Comment = { fg = c.comment, italic = true },
        Constant = { fg = c.constant },
        String = { fg = c.string },
        Character = { fg = c.string },
        Number = { fg = c.number },
        Boolean = { fg = c.boolean },
        Float = { fg = c.number },

        Identifier = { fg = c.variable },
        Function = { fg = c.func },

        Statement = { fg = c.keyword },
        Conditional = { fg = c.keyword },
        Repeat = { fg = c.keyword },
        Label = { fg = c.label },
        Operator = { fg = c.operator },
        Keyword = { fg = c.keyword },
        Exception = { fg = c.keyword },

        PreProc = { fg = c.preproc },
        Include = { fg = c.preproc },
        Define = { fg = c.preproc },
        Macro = { fg = c.preproc },

        Type = { fg = c.type },
        StorageClass = { fg = c.keyword },
        Structure = { fg = c.type },
        Typedef = { fg = c.type },

        Special = { fg = c.variable_special, italic = true },
        SpecialChar = { fg = c.string_escape },
        Tag = { fg = c.tag },
        Delimiter = { fg = c.punctuation },

        Title = { fg = c.title, bold = true },
        Todo = { fg = c.accent, bg = c.element, bold = true },

        -- UI
        Pmenu = { fg = c.fg, bg = c.float },
        PmenuSel = { fg = c.blend_bg, bg = c.accent },
        PmenuSbar = { bg = c.element },
        PmenuThumb = { bg = c.element_hover },

        StatusLine = { fg = c.fg, bg = c.element },
        StatusLineNC = { fg = c.fg_muted, bg = c.blend_bg },
        StatusLineTerm = { fg = c.fg, bg = c.element },
        StatusLineTermNC = { fg = c.fg_muted, bg = c.blend_bg },
        WinBar = { fg = c.fg_muted, bg = c.surface },
        WinBarNC = { fg = c.fg_subtle, bg = c.surface },

        TabLine = { fg = c.fg_muted, bg = c.bg },
        TabLineFill = { bg = c.bg },
        TabLineSel = { fg = c.fg, bg = c.element },

        NavicText = { fg = c.fg_muted, bg = c.surface },
        NavicSeparator = { fg = c.fg_subtle, bg = c.surface },
        NavicIconsFile = { fg = c.fg_muted, bg = c.surface },
        NavicIconsModule = { fg = c.type, bg = c.surface },
        NavicIconsNamespace = { fg = c.type, bg = c.surface },
        NavicIconsPackage = { fg = c.type, bg = c.surface },
        NavicIconsClass = { fg = c.type, bg = c.surface },
        NavicIconsMethod = { fg = c.func, bg = c.surface },
        NavicIconsProperty = { fg = c.property, bg = c.surface },
        NavicIconsField = { fg = c.property, bg = c.surface },
        NavicIconsConstructor = { fg = c.constructor, bg = c.surface },
        NavicIconsEnum = { fg = c.enum, bg = c.surface },
        NavicIconsInterface = { fg = c.type, bg = c.surface },
        NavicIconsFunction = { fg = c.func, bg = c.surface },
        NavicIconsVariable = { fg = c.variable, bg = c.surface },
        NavicIconsConstant = { fg = c.constant, bg = c.surface },
        NavicIconsString = { fg = c.string, bg = c.surface },
        NavicIconsNumber = { fg = c.number, bg = c.surface },
        NavicIconsBoolean = { fg = c.boolean, bg = c.surface },
        NavicIconsArray = { fg = c.punctuation, bg = c.surface },
        NavicIconsObject = { fg = c.punctuation, bg = c.surface },
        NavicIconsKey = { fg = c.property, bg = c.surface },
        NavicIconsNull = { fg = c.constant, bg = c.surface },
        NavicIconsEnumMember = { fg = c.enum, bg = c.surface },
        NavicIconsStruct = { fg = c.type, bg = c.surface },
        NavicIconsEvent = { fg = c.yellow, bg = c.surface },
        NavicIconsOperator = { fg = c.operator, bg = c.surface },
        NavicIconsTypeParameter = { fg = c.type_builtin, bg = c.surface },

        BufferLineFill = { bg = c.surface },
        BufferLineBackground = { fg = c.fg_muted, bg = c.surface },
        BufferLineBuffer = { fg = c.fg_muted, bg = c.surface },
        BufferLineBufferSelected = { fg = c.fg, bg = c.bg, bold = true },
        BufferLineTab = { fg = c.fg_muted, bg = c.surface },
        BufferLineTabSelected = { fg = c.fg, bg = c.bg },
        BufferLineTabClose = { fg = c.fg_muted, bg = c.surface },
        BufferLineCloseButton = { fg = c.fg_muted, bg = c.surface },
        BufferLineCloseButtonSelected = { fg = c.fg_muted, bg = c.bg },
        BufferLineModified = { fg = c.accent, bg = c.surface },
        BufferLineModifiedSelected = { fg = c.accent, bg = c.bg },
        BufferLineSeparator = { fg = c.border, bg = c.surface },
        BufferLineSeparatorSelected = { fg = c.border, bg = c.bg },
        BufferLineIndicatorSelected = { fg = c.accent, bg = c.bg },

        NvimTreeNormal = { fg = c.fg, bg = c.bg },
        NvimTreeNormalNC = { fg = c.fg, bg = c.bg },
        NvimTreeEndOfBuffer = { fg = c.bg, bg = c.bg },
        NvimTreeRootFolder = { fg = c.fg, bg = c.bg, bold = true },
        NvimTreeFolderName = { fg = c.type_builtin },
        NvimTreeOpenedFolderName = { fg = c.accent, italic = true },
        NvimTreeEmptyFolderName = { fg = c.fg_subtle },
        NvimTreeOpenedFile = { fg = c.fg, italic = false },
        NvimTreeSpecialFile = { fg = c.fg, underline = false },
        NvimTreeExecFile = { fg = c.fg },
        NvimTreeFolderIcon = { fg = c.type_builtin },
        NvimTreeIndentMarker = { fg = c.border },
        NvimTreeCursorLine = { bg = c.cursorline },
        NvimTreeGitDirty = { fg = c.yellow },
        NvimTreeGitDirtyIcon = { fg = c.yellow },
        NvimTreeGitNew = { fg = c.green },
        NvimTreeGitNewIcon = { fg = c.green },
        NvimTreeGitDeleted = { fg = c.red },
        NvimTreeGitDeletedIcon = { fg = c.red },
        NvimTreeGitStaged = { fg = c.green },
        NvimTreeGitStagedIcon = { fg = c.green },
        NvimTreeGitMerge = { fg = c.yellow },
        NvimTreeGitMergeIcon = { fg = c.yellow },
        NvimTreeGitRenamed = { fg = c.yellow },
        NvimTreeGitRenamedIcon = { fg = c.yellow },
        NvimTreeGitIgnored = { fg = c.fg_subtle },
        NvimTreeGitIgnoredIcon = { fg = c.fg_subtle },
        NvimTreeModifiedFile = { fg = c.yellow },
        NvimTreeModifiedIcon = { fg = c.yellow },

        NeoTreeNormal = { fg = c.fg, bg = c.bg },
        NeoTreeNormalNC = { fg = c.fg, bg = c.bg },
        NeoTreeEndOfBuffer = { fg = c.bg, bg = c.bg },
        NeoTreeDirectoryName = { fg = c.type_builtin },
        NeoTreeDirectoryIcon = { fg = c.type_builtin },
        NeoTreeRootName = { fg = c.fg, bold = true },
        NeoTreeFileName = { fg = c.fg },
        NeoTreeFileNameOpened = { fg = c.fg, italic = false },
        NeoTreeIndentMarker = { fg = c.border },
        NeoTreeCursorLine = { bg = c.cursorline },
        NeoTreeGitModified = { fg = c.yellow },
        NeoTreeGitUnstaged = { fg = c.fg_muted },
        NeoTreeModified = { fg = c.yellow },

        -- Diagnostics
        DiagnosticError = { fg = c.red },
        DiagnosticWarn = { fg = c.yellow },
        DiagnosticInfo = { fg = c.info },
        DiagnosticHint = { fg = c.hint },

        DiagnosticVirtualTextError = { fg = c.red, bg = c.red_bg },
        DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.yellow_bg },
        DiagnosticVirtualTextInfo = { fg = c.info, bg = c.info_bg },
        DiagnosticVirtualTextHint = { fg = c.hint, bg = c.hint_bg },

        -- Diff / git
        DiffAdd = { fg = c.green, bg = c.green_bg },
        DiffChange = { fg = c.yellow, bg = c.yellow_bg },
        DiffDelete = { fg = c.red, bg = c.red_bg },
        DiffText = { fg = c.yellow, bg = c.yellow_bg },

        -- Treesitter
        ["@comment"] = { link = "Comment" },

        ["@constant"] = { fg = c.constant },
        ["@constant.builtin"] = { fg = c.constant },
        ["@boolean"] = { fg = c.boolean },
        ["@number"] = { fg = c.number },
        ["@float"] = { fg = c.number },

        ["@string"] = { fg = c.string },
        ["@string.escape"] = { fg = c.string_escape },
        ["@string.regex"] = { fg = c.string_regex },
        ["@character"] = { fg = c.string },

        ["@variable"] = { fg = c.variable },
        ["@variable.builtin"] = { fg = c.variable_special, italic = true },
        ["@variable.parameter"] = { fg = c.parameter, italic = true },
        ["@variable.member"] = { fg = c.variable },

        ["@function"] = { fg = c.func },
        ["@function.call"] = { fg = c.func },
        ["@function.method"] = { fg = c.func },
        ["@function.method.call"] = { fg = c.func },
        ["@constructor"] = { fg = c.constructor },

        ["@keyword"] = { fg = c.keyword },
        ["@keyword.function"] = { fg = c.keyword },
        ["@keyword.return"] = { fg = c.keyword },
        ["@conditional"] = { fg = c.keyword },
        ["@repeat"] = { fg = c.keyword },
        ["@operator"] = { fg = c.operator },

        ["@type"] = { fg = c.type },
        ["@type.builtin"] = { fg = c.type_builtin },
        ["@property"] = { fg = c.property },
        ["@field"] = { fg = c.property },

        ["@punctuation"] = { fg = c.punctuation },
        ["@punctuation.delimiter"] = { fg = c.punctuation },
        ["@punctuation.bracket"] = { fg = c.bracket },
        ["@punctuation.special"] = { fg = c.punctuation },

        ["@tag"] = { fg = c.tag },
        ["@tag.attribute"] = { fg = c.attribute, italic = true },
        ["@tag.delimiter"] = { fg = c.punctuation },

        ["@markup.heading"] = { fg = c.title, bold = true },
        ["@markup.strong"] = { fg = c.strong, bold = true },
        ["@markup.italic"] = { fg = c.emphasis, italic = true },
        ["@markup.link"] = { fg = c.link },
        ["@markup.link.url"] = { fg = c.link_uri, underline = true },
        ["@markup.raw"] = { fg = c.string },
    }
end

return M
