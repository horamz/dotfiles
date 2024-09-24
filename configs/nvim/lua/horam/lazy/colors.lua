function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    --{
    --    "rose-pine/neovim",
    --    name = "rose-pine",
    --    config = function()
    --        require('rose-pine').setup({
    --            --disable_background = true,

    --            styles = {
    --                bold = false,
    --                transparent = false,
    --                italic = false,
    --            },

    --            highlight_groups = {
    --                ColorColumn = { bg = 'rose' },
    --                StatusLine = { fg = 'love', bg = "#2E202F"},
    --                StatusLineNC = { fg = "subtle", bg = "surface"},

    --                MatchParen = {fg = "pine", bg = "pine", blend = 0},

    --                TelescopeBorder = { fg = "overlay", bg = "overlay" },
    --                TelescopeNormal = { fg = "subtle", bg = "overlay" },
    --                TelescopeSelection = { fg = "text", bg = "highlight_med" },
    --                TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
    --                TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

    --                TelescopeTitle = { fg = "base", bg = "love" },
    --                TelescopePromptTitle = { fg = "base", bg = "pine" },
    --                TelescopePreviewTitle = { fg = "base", bg = "iris" },

    --                TelescopePromptNormal = { fg = "text", bg = "surface" },
    --                TelescopePromptBorder = { fg = "surface", bg = "surface" },

    --                Search = {bg = 'gold', inherit = false}
    --            }
    --        })

    --        vim.opt.laststatus = 2 -- Or 3 for global statusline
    --        vim.opt.statusline = " %f %m %= %l:%c ♥ "

    --        vim.cmd("colorscheme rose-pine")

    --        --ColorMyPencils()
    --    end
    --},
    --{
    --    "xiyaowong/transparent.nvim",
    --},
    {
        "folke/tokyonight.nvim",
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
            vim.cmd.colorscheme("tokyonight");
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
                highlight_groups = {
                    TelescopeBorder = { fg = "overlay", bg = "overlay" },
                    TelescopeNormal = { fg = "subtle", bg = "overlay" },
                    TelescopeSelection = { fg = "text", bg = "highlight_med" },
                    TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
                    TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

                    TelescopeTitle = { fg = "base", bg = "love" },
                    TelescopePromptTitle = { fg = "base", bg = "pine" },
                    TelescopePreviewTitle = { fg = "base", bg = "iris" },

                    TelescopePromptNormal = { fg = "text", bg = "surface" },
                    TelescopePromptBorder = { fg = "surface", bg = "surface" },

                    StatusLine = { fg = "love", bg = "love", blend = 10 },
                    StatusLineNC = { fg = "subtle", bg = "surface" },
                },
            })
           -- vim.opt.laststatus = 2
           -- vim.opt.statusline = " %f %m %= %l:%c ♥ "
           -- ColorMyPencils()
        end
    },
}
