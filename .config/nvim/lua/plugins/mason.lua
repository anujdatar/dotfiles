return {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'lua-language-server',
                'stylua',
                'css-lsp',
                'eslint-lsp',
                'html-lsp',
                'typescript-language-server',
                'vue-language-server',
                'svelte-language-server',
                'clangd',
                'clang-format',
                'python-lsp-server',
                'black',
                'gopls',
                'rust-analyzer',
                'dockerfile-language-server',
                'yaml-language-server',
                'bash-language-server',
                'shellcheck',
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
        end,
    },
}
