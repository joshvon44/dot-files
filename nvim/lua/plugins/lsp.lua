return {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({
                    buffer = bufnr,
                    preserve_mappings = false
                })
                vim.keymap.set({'n', 'x'}, 'gq', function()
                    vim.lsp.buf.format({async = false, timeout_ms = 10000})
                end, opts)
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
              ensure_installed = {'bashls', 'clangd', 'pylsp', 'rust_analyzer', 'zls'},
              handlers = {
                function(server_name)
                  require('lspconfig')[server_name].setup({})
                end,
              },
            })

            -- Set up LSP language servers
            -- Python LSP
--            require('lspconfig').pylsp.setup({})
--
--            -- Rust LSP
--            require('lspconfig').rust_analyzer.setup({})
--
--            -- C LSP
--            require('lspconfig').clangd.setup({})
        end,
    },
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
              mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({select = true}),
                --['<Tab>'] = cmp_action.tab_complete(),
                --['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
              }),
            })
        end
    },
    {'L3MON4D3/LuaSnip'},
}
