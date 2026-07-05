# lumin.nvim

A Neovim colorscheme ported from [frypan-5/Lumin](https://github.com/frypan-5/Lumin).

Lumin keeps the editor surface quiet and low-contrast, with a warm accent color and restrained syntax colors.

## Variants

Lumin ships with three variants:

| Variant | Colorscheme |
| --- | --- |
| Regular | `lumin` |
| Light | `lumin-light` |
| Blur | `lumin-blur` |

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "fudoge/lumin-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("lumin")
  end,
}
```

For the light or blur variants:

```lua
vim.cmd.colorscheme("lumin-light")
vim.cmd.colorscheme("lumin-blur")
```

## Configuration

You can configure the default variant before loading the colorscheme:

```lua
require("lumin").setup({
  variant = "regular", -- "regular", "light", or "blur"
})

vim.cmd.colorscheme("lumin")
```

The dedicated colorscheme files set the variant automatically:

```lua
vim.cmd.colorscheme("lumin-light") -- uses variant = "light"
vim.cmd.colorscheme("lumin-blur")  -- uses variant = "blur"
```

## Lualine

Lumin provides lualine themes:

```lua
require("lualine").setup({
  options = {
    theme = "lumin",
  },
})
```

Available lualine themes:

| Theme | Behavior |
| --- | --- |
| `lumin` | Uses the current Lumin variant |
| `lumin-light` | Forces the light palette |
| `lumin-blur` | Forces the blur palette |

If lualine displays the mode twice, disable Neovim's built-in mode text:

```lua
vim.o.showmode = false
```

### Lualine overrides

You can override the generated lualine theme directly:

```lua
require("lualine").setup({
  options = {
    theme = require("lumin.integrations.lualine")("light", {
      normal = {
        c = { bg = "NONE" },
      },
    }),
  },
})
```

Or define global and variant-specific overrides through Lumin:

```lua
require("lumin").setup({
  variant = "light",
  integrations = {
    lualine = {
      all = {
        normal = {
          c = { bg = "NONE" },
        },
      },
      light = {
        normal = {
          a = { bg = "#B96F3D" },
        },
      },
    },
  },
})
```

## Supported highlights

Lumin includes highlight groups for:

- Neovim UI and syntax groups
- Treesitter captures
- Diagnostics and diff groups
- Bufferline
- NvimTree
- Neo-tree
- Navic breadcrumbs
- lualine

## Credits

- Original theme: [frypan-5/Lumin](https://github.com/frypan-5/Lumin)
- Neovim port: [fudoge/lumin-nvim](https://github.com/fudoge/lumin-nvim)

## License

MIT
