return {
    -- Auto adjusting indentation
    { "tpope/vim-sleuth" },
    -- Surround highlighted text 
    {
        "kylechui/nvim-surround",
        init = function()
            require("nvim-surround").setup()
        end,
    },
    -- Provides hints for what key mappings do
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                vim.keymap.set('n', 'tt', api.tree.toggle, opts('Toggle nvim tree'))

            end,
        }
    },
}
