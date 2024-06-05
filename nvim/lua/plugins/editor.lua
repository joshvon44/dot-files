return {
    { "tpope/vim-sleuth" },
    {
        "kylechui/nvim-surround",
        init = function()
            require("nvim-surround").setup()
        end,
    },
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
        }
    },
}
