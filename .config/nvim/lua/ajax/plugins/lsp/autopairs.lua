return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    config = function()
        require('nvim-autopairs').setup({
            check_ts = true, -- enable treesitter
            ts_config = {
                lua = { 'string' }, -- it will not add a pair on that treesitter node
                javascript = { 'template_string' },
                java = false, -- don't check treesitter on java
            },
            fast_wrap = {}, -- use fast wrap
            disable_filetype = { 'TelescopePrompt', 'vim' }, -- disable autopairs for these filetypes
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        -- make autopairs and cmp work together
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}
