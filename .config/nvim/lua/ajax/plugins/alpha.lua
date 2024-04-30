return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- Set header
        dashboard.section.header.val = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }

        -- Set custom menu
        dashboard.section.buttons.val = {
            dashboard.button('e', '  > New file', '<cmd>ene<CR>'),

            dashboard.button(
                'SPC tt',
                '  > Toggle file explorer',
                '<cmd>NvimTreeToggle<CR>'
            ),

            dashboard.button(
                'SPC ff',
                '󰱼 > Find file',
                '<cmd>Telescope find_files<CR>'
            ),

            dashboard.button(
                'SPC fo',
                '  > Recently opened files',
                '<cmd>Telescope oldfiles<CR>'
            ),

            dashboard.button(
                'SPC fg',
                '  > Find word',
                '<cmd>Telescope live_grep<CR>'
            ),

            dashboard.button(
                'SPC wr',
                '󰁯  > Restore last session',
                '<cmd>SessionRestore<CR>'
            ),

            dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
