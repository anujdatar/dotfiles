return {
    'gbprod/substitute.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local substitute = require('substitute')
        substitute.setup()

        -- set keymaps
        vim.keymap.set(
            'n',
            's',
            substitute.operator,
            { desc = '[S]ubstitute with motion' }
        )
        vim.keymap.set(
            'n',
            'ss',
            substitute.line,
            { desc = '[S]ub[S]titute line' }
        )
        vim.keymap.set(
            'n',
            'S',
            substitute.eol,
            { desc = '[S]ubstitute till end of line' }
        )
        vim.keymap.set(
            'x',
            's',
            substitute.visual,
            { desc = '[S]ubstitute in visual mode' }
        )
    end,
}
