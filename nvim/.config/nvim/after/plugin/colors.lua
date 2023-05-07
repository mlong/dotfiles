function ColorMe(color)
    vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

    color = color or "gruvbox"

    require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
    })

    require("rose-pine").setup({
        --- @usage 'main' | 'moon'
        dark_variant = 'main',
        bold_vert_split = false,
        dim_nc_background = true,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = 'base',
            panel = 'surface',
            border = 'highlight_med',
            comment = 'muted',
            link = 'iris',
            punctuation = 'subtle',

            error = 'love',
            hint = 'iris',
            info = 'foam',
            warn = 'gold',

            headings = {
                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            }
        },
        highlight_groups = {
            ColorColumn = { bg = "surface" }
        }
    })

    vim.cmd.colorscheme(color)
end

ColorMe()
