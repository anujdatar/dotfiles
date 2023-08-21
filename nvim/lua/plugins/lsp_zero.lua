return {
    {
        -- lsp-zero
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Automatically install lsps to stdpath for neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Useful status updates for lsp
            -- NOTE: `opts = {}` is same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing (apparently)
            { 'folke/neodev.nvim', opts = {} },


            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            -- Snipped Engine & its associated nvim-cmp source
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Adds lsp completion capabilities
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },

            -- Adds a number of user-friendly snippets
            {'rafamadriz/friendly-snippets'},
            {
                'windwp/nvim-autopairs',
                event = 'InsertEnter',
                opts = {
                    fast_wrap = {},
                    disable_filetype = { 'TelescopePrompt', 'vim' },
                },
            },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            lsp.nvim_workspace()
            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })

                local map = function(key, cmd, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    local set_map = require('utils').set_keymap
                    set_map('n', key, cmd, desc, bufnr)
                end

                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
                map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                map('<leader>ds', vim.lsp.buf.document_symbol, 'Goto [D]ocument [S]ymbol')
                map('<leader>ws', vim.lsp.buf.workspace_symbol, 'Goto [W]orkspace [S]ymbol')

                -- See `:help K` for why this is useful
                map('K', vim.lsp.buf.hover, 'Hover Documentation')
                map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

                -- Lesser used LSP functionality
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd folder')
                map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove folder')
                map('<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, '[W]orkspace [L]ist folders'
                )

                -- create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                    vim.lsp.buf.format()
                end, {desc = 'Format current buffer with LSP'}
                )
            end)

            lsp.setup()

            local cmp = require('cmp')
            local luasnip = require('luasnip')
            -- local cmp_action = require('lsp-zero').cmp_action

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    -- `Enter` selects completion item
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' })
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                }
            })
        end,
    },
}
