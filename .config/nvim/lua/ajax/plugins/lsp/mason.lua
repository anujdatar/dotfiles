return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim'
        },
        opts = {
            ensure_installed = {
                'lua-language-server', --lua lsp
                'stylua', -- lua formatter
                'css-lsp', -- css lsp
                'tailwindcss-language-server', -- tailwindcss lsp
                'eslint-lsp', -- javascript lsp
                'eslint_d', -- javascript linter
                'html-lsp',
                'typescript-language-server',
                'vue-language-server',
                'svelte-language-server',
                'clangd',
                'clang-format',
                -- 'python-lsp-server', -- python lsp
                'pylint', -- python linter
                'pyright', -- python lsp
                'isort', -- python formatter - import sorter
                'black', -- python formatter
                'gopls', -- go language server
                'goimports', -- go imports sorter
                'rust-analyzer',
                'dockerfile-language-server',
                'yaml-language-server',
                'bash-language-server',
                'shellcheck',
                'prittier',
                'ltex-ls'
            },
            ui = {
                icons = {
                package_pending = " ",
                package_installed = "󰄳 ",
                package_uninstalled = " 󰚌",
                },
            },
        },
        config = function(_, opts)
            require('mason').setup(opts)
            vim.api.nvim_create_user_command('MasonInstallAll', function()
                vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
            end, {})

            -- keymaps
            vim.keymap.set('n', '<leader>ma', vim.cmd.Mason,
                { noremap = true, silent = true, desc = '[M]ason [A]ction' }
            )
            vim.keymap.set('n', '<leader>mi', vim.cmd.MasonInstallAll,
                { noremap = true, silent = true, desc = '[M]ason [I]nstall All' }
            )
        end,
    },
}
