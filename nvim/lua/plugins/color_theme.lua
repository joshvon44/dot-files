return {
    {
        { 
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                -- Make background transparent, in case terminal is transparent
                require("catppuccin").setup({
                    transparent_background = true
                })

                -- Setup must be called before loading colorscheme
                vim.cmd.colorscheme "catppuccin"
            end,
        },
    },
-- vim.cmd.colorscheme "catppuccin"
}
