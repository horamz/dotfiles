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
                default_mappings = false,
                mappings = {
                    i = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                    c = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                    t = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                    v = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                    s = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                },
            })
        end,
    }
}
