return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        { 'folke/todo-comments.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                    },
                    n = {
                        ['<esc>'] = actions.close,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                    },
                },
            },
        })
        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')

        local builtin = require('telescope.builtin')

        -- set keymaps
        vim.keymap.set(
            'n',
            '<leader>ff',
            builtin.find_files,
            { desc = '[F]ind [F]iles' }
        )
        vim.keymap.set(
            'n',
            '<leader>fa',
            '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',
            { desc = '[F]ind [A]ll files' }
        )
        vim.keymap.set(
            'n',
            '<leader>fw',
            builtin.grep_string,
            { desc = '[F]ind current [W]ord' }
        )
        vim.keymap.set(
            'n',
            '<leader>fg',
            builtin.live_grep,
            { desc = '[F]ind by [G]rep' }
        )
        vim.keymap.set(
            'n',
            '<leader>fb',
            builtin.buffers,
            { desc = '[F]ind [B]uffers' }
        )
        vim.keymap.set(
            'n',
            '<leader>fz',
            builtin.current_buffer_fuzzy_find,
            { desc = 'Fuzzily [F]ind in current [B]uffers' }
        )
        vim.keymap.set(
            'n',
            '<leader>fo',
            builtin.oldfiles,
            { desc = '[F]ind recently [O]pened files' }
        )
        vim.keymap.set(
            'n',
            '<leader>fd',
            builtin.diagnostics,
            { desc = '[F]ind [D]iagnostics' }
        )
        vim.keymap.set(
            'n',
            '<leader>fh',
            builtin.help_tags,
            { desc = '[F]ind [H]elp tags' }
        )
        vim.keymap.set(
            'n',
            '<leader>fm',
            builtin.marks,
            { desc = '[F]ind book[M]arks' }
        )
        vim.keymap.set(
            'n',
            '<leader>ft',
            '<cmd>TodoTelescope<cr>',
            { desc = '[F]ind [T]odos' }
        ) -- telescope integration for todo-comments

        vim.keymap.set(
            'n',
            '<leader>fr',
            builtin.registers,
            { desc = '[F]ind [R]egisters' }
        )
        vim.keymap.set(
            'n',
            '<leader>fl',
            builtin.loclist,
            { desc = '[F]ind [L]ocation list' }
        )
        vim.keymap.set(
            'n',
            '<leader>fs',
            builtin.spell_suggest,
            { desc = '[F]ind [S]pell suggestions' }
        )
        vim.keymap.set(
            'n',
            '<leader>fc',
            builtin.commands,
            { desc = '[F]ind [C]ommands' }
        )
        vim.keymap.set(
            'n',
            '<leader>fq',
            builtin.quickfix,
            { desc = '[F]ind [Q]uickfix' }
        )

        vim.keymap.set(
            'n',
            '<leader>tg',
            builtin.git_files,
            { desc = '[T]elescope: [G]it Files' }
        )
        vim.keymap.set(
            'n',
            '<leader>tc',
            builtin.git_commits,
            { desc = '[T]elescope: Search Git [C]ommits' }
        )
        vim.keymap.set(
            'n',
            '<leader>tb',
            builtin.git_branches,
            { desc = '[T]elescope: Search Git [B]ranches' }
        )
        vim.keymap.set(
            'n',
            '<leader>ts',
            builtin.git_status,
            { desc = '[T]elescope: Search Git [S]tatus' }
        )
    end,
}
