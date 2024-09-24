return {
    {
        'echasnovski/mini.indentscope',
        version = false,
        event = "VeryLazy",
        opts = {
            symbol = "│",
            options = { try_as_border = true}
        },
        config = function ()
            require("mini.indentscope").setup()
        end
    },
    { "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function ()
            require("ibl").setup({
                scope = {enabled = false},
            })
        end
    },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                timeout = 200,
                default_mappings = true,
                mappings = {
                    i = {
                        k = {
                            j = "<Esc>",
                        },
                    },
                    c = {
                        k = {
                            j = "<Esc>",
                        },
                    },
                    t = {
                        k = {
                            j = "<Esc>",
                        },
                    },
                    v = {
                        k = {
                            j = "<Esc>",
                        },
                    },
                    s = {
                        k = {
                            j = "<Esc>",
                        },
                    },
                },
            })
        end,
    }
}
