return {
    -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring', -- commenting for tsx and jsx files
    },
    config = function()
        local comment = require('Comment')
        local api = require('Comment.api')

        local ts_context_commentstring =
            require('ts_context_commentstring.integrations.comment_nvim')

        -- keymaps - based on Comment.nvim documentation
        -- for some reason <C-_> here works as C-/
        vim.keymap.set(
            'n',
            '<C-_>',
            api.toggle.linewise.current,
            { desc = 'Toggle comment on current line' }
        )
        vim.keymap.set(
            'n',
            '<C-\\>',
            api.toggle.blockwise.current,
            { desc = 'Toggle comment on selected line' }
        )

        -- enable toggling selected text
        local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

        -- for some reason <C-_> here works as C-/
        vim.keymap.set('x', '<C-_>', function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            api.toggle.linewise(vim.fn.visualmode())
        end, { desc = 'Toggle comment on current line' })
        vim.keymap.set('x', '<C-\\>', function()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            api.toggle.blockwise(vim.fn.visualmode())
        end, { desc = 'Toggle comment on selected line' })

        comment.setup({
            -- for commenting tsx and jsx files
            pre_hook = ts_context_commentstring.create_pre_hook(),
            -- replace the regular 'gc' and 'gb' keymaps, use above to keep original also
            -- toggler = {
            --     line = '<leader>/',
            --     block = '<leader>\\',
            -- },
            -- opleader = {
            --     line = '<leader>/',
            --     block = '<leader>\\',
            -- },
        })
    end,
}
