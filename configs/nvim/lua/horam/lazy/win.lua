return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function ()
            require("neo-tree").setup({
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function (file_path)
                            require("neo-tree.command").execute({action = "close"})
                        end
                    },
                    --{
                    --    event = "neo_tree_window_after_open",
                    --    handler = function(args)
                    --        if args.position == "left" or args.position == "right" then
                    --            vim.cmd("wincmd =")
                    --        end
                    --    end
                    --},
                    --{
                    --    event = "neo_tree_window_after_close",
                    --    handler = function(args)
                    --        if args.position == "left" or args.position == "right" then
                    --            vim.cmd("wincmd =")
                    --        end
                    --    end
                    --}
                }
            })
            vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<cr>")
        end
    },
    {
        'akinsho/bufferline.nvim',
        --version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require("bufferline").setup({})
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require('lualine').setup {
                options = { theme = 'tokyonight'},
                sections = {
                    lualine_b = {'branch', 'diff'},
                    lualine_c = {'filename', 'lsp_progress'},
                }
            }
        end
    },
}
