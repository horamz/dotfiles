return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
            vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
        end
    },

    {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
    {"windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-ts-autotag').setup()
        end
    },
    {
        "simrat39/rust-tools.nvim",
        name = "rust-tools",
        event = "VeryLazy",
        opts = {
            tools = {
                inlay_hints = {
                    auto = true,
                    only_current_line = false,
                    show_parameter_hints = true,
                    parameter_hints_prefix = "<- ",
                    other_hints_prefix = "=> ",
                    max_len_align = false,
                    max_len_align_padding = 1,
                    right_align = false,
                    right_align_padding = 7,
                    highlight = "Comment",
                }
            }
        },

        config = function ()
            require("rust-tools").setup({})

            vim.keymap.set("n", "<F8>", "<cmd>RustRunnables<cr>")
            vim.keymap.set("n", "<F9>", "<cmd>RustDebuggables<cr>")

        end
    },


    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function ()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end)
        end
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function ()
            require("nvim-surround").setup({

            })
        end
    },
}
