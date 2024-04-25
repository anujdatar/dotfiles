return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file paths
        'hrsh7th/cmp-nvim-lsp', -- source for nvim lsp
        'hrsh7th/cmp-nvim-lua', -- source for nvim lua

        {
            'L3MON4D3/LuaSnip',
            -- follow latest release
            version = 'v2.*',
            -- build = 'make install_jsxregexp',
        },

        'saadparwaiz1/cmp_luasnip', -- source for LuaSnip
        'rafamadriz/friendly-snippets', -- source for 'friendly-snippets'
        'onsails/lspkind-nvim', -- vscode like pictograms

        'hrsh7th/cmp-emoji', -- emoji completion i guess, never used before
    },
    config = function()
        local cmp = require('cmp')

        local luasnip = require('luasnip')

        local lspkind = require('lspkind')

        -- associate vimwiki and markdown with markdown source
        luasnip.filetype_extend('vimwiki', { 'markdown' })

        -- loads vscode style snippets from plugins
        -- and custom snippets from ~/.config/nvim/snippets
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load(
            { paths = "~/.config/nvim/snippets" }
        )

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
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
                ['<Tab>'] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    { 'i', 's' }
                ),
                ['<S-Tab>'] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }
                ),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'nvim_lua' },
                { name = 'path' },
            },
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = '...',
                }),
            },
        })
    end,
}
