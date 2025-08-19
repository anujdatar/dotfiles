return {
    -- Git plugins
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set(
                'n',
                '<leader>gs',
                vim.cmd.Git,
                { noremap = true, silent = true, desc = '[G]it [S]tatus' }
            )
            vim.keymap.set(
                'n',
                '<leader>gb',
                vim.cmd.Gblame,
                { noremap = true, silent = true, desc = '[G]it [B]lame' }
            )
            vim.keymap.set(
                'n',
                '<leader>gc',
                vim.cmd.Gcommit,
                { noremap = true, silent = true, desc = '[G]it [C]ommit' }
            )
            vim.keymap.set(
                'n',
                '<leader>gf',
                vim.cmd.Gdiff,
                { noremap = true, silent = true, desc = '[G]it di[F]f' }
            )
            vim.keymap.set(
                'n',
                '<leader>gp',
                vim.cmd.Gpull,
                { noremap = true, silent = true, desc = '[G]it [P]ull' }
            )
            vim.keymap.set(
                'n',
                '<leader>gP',
                vim.cmd.Gpush,
                { noremap = true, silent = true, desc = '[G]it [P]ush' }
            )
        end,
    },
    { 'tpope/vim-rhubarb' },
}
