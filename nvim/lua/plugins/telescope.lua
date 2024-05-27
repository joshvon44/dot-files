return {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.7',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function(_, opts)

            require('telescope').load_extension('fzf')
        end,
        keys = {
            {
                "<space>f",
                function()
                    require('telescope.builtin').find_files()
                end,
                desc = "File picking for CWD"
            },
            {
                "<space>/",
                function()
                    require('telescope.builtin').live_grep()
                end,
                desc = "Search for some text within all files in CWD"
            },
            {
                "<space>b",
                function()
                    require('telescope.builtin').buffers()
                end,
                desc = "Search the current open buffers",
            },
            {
                "<space>h",
                function()
                    require('telescope.builtin').help_tags()
                end,
                desc = "Search Neovim help documentation",
            },
        }

    },
}
