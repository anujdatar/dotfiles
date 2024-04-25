return {
    'akinsho/bufferline.nvim',
    version = '*',
    enabled = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        options = {
            -- mode = 'tabs',
            separator_style = 'slant',
            indicator = {
                style = 'underline',
            },
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    separator = true,
                },
            },
            hover = {
                enabled = true,
                delay = 50,
                reveal = {'close'},
            },
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or ""
                return " " .. icon .. count
            end,
        },
    },
    config = function(_, opts)
        require('bufferline').setup(opts)

    --     -- keymaps
        vim.keymap.set('n', '<leader>mb', vim.cmd.BufferLinePick,
            { noremap = true, silent = true, desc = '[M]ove to selected [B]uffer' }
        )
        vim.keymap.set('n', '<leader>bc', vim.cmd.BufferLinePickClose,
            { noremap = true, silent = true, desc = '[B]uffer [D]elete' }
        )
        vim.keymap.set('n', '<leader>bn', vim.cmd.BufferLineCycleNext,
            { noremap = true, silent = true, desc = '[B]uffer [N]ext' }
        )
        vim.keymap.set('n', '<leader>bp', vim.cmd.BufferLineCyclePrev,
            { noremap = true, silent = true, desc = '[B]uffer [P]revious' }
        )
        vim.keymap.set('n', '<leader>bxr', vim.cmd.BufferLineCloseRight,
            { noremap = true, silent = true, desc = '[B]uffer [C]lose [R]ight' }
        )
        vim.keymap.set('n', '<leader>bxl', vim.cmd.BufferLineCloseLeft,
            { noremap = true, silent = true, desc = '[B]uffer [C]lose [L]eft' }
        )
        vim.keymap.set('n', '<leader>bxo', vim.cmd.BufferLineCloseOthers,
            { noremap = true, silent = true, desc = '[B]uffer [C]lose [O]thers' }
        )
    end,
}
