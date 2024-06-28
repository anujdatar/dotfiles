return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true }, -- must be loaded before i think
        { 'williamboman/mason-lspconfig.nvim' },
        { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
        { 'j-hui/fidget.nvim', opts = {} }, -- useful for status updates updates
        { 'folke/neodev.nvim', opts = {} }, -- better lsp for lua
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup(
                'UserLspAttach',
                { clear = true }
            ),
            callback = function(event)
                local map = function(mode, keys, func, desc)
                    vim.keymap.set(
                        mode,
                        keys,
                        func,
                        { buffer = event.buf, desc = desc }
                    )
                end

                local t_builtin = require('telescope.builtin')

                -- jump to var or function definition/declaration
                map(
                    'n',
                    '<leader>gd',
                    t_builtin.lsp_definitions,
                    '[G]o to [D]efinition'
                )

                -- find references of work under cursor
                map(
                    'n',
                    '<leader>gr',
                    t_builtin.lsp_references,
                    '[G]o to [R]eferences'
                )

                -- jump to implementation of interface
                -- where declaration and implementation are different
                map(
                    'n',
                    '<leader>gi',
                    t_builtin.lsp_implementations,
                    '[G]o to [I]mplementation'
                )

                -- jump to type definition
                map(
                    'n',
                    '<leader>gt',
                    t_builtin.lsp_type_definitions,
                    '[G]o to [T]ype definition'
                )

                -- fuzzy find all symbols (vars, funcs, types) in document
                map(
                    'n',
                    '<leader>ds',
                    t_builtin.lsp_document_symbols,
                    'Go to [D]ocument [S]ymbol'
                )

                -- fuzzy find all symbols (vars, funcs, types) in workspace/project
                map(
                    'n',
                    '<leader>ws',
                    t_builtin.lsp_workspace_symbols,
                    'Go to [W]orkspace [S]ymbol'
                )

                -- Rename the variable under your cursor, should work across files
                map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map(
                    'n',
                    '<leader>ca',
                    vim.lsp.buf.code_action,
                    '[C]ode [A]ction'
                )

                -- displays docs about the word under your cursor
                --  See `:help K` for why this keymap.
                map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')

                -- Displays the signature of the function under your cursor
                map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map(
                    'n',
                    '<leader>gD',
                    vim.lsp.buf.declaration,
                    '[G]oto [D]eclaration'
                )

                map(
                    'n',
                    '<leader>wa',
                    vim.lsp.buf.add_workspace_folder,
                    '[W]orkspace: [A]dd Folder'
                )

                map(
                    'n',
                    '<leader>wr',
                    vim.lsp.buf.remove_workspace_folder,
                    '[W]orkspace: [R]emove Folder'
                )

                -- map('n', '<leader>wn', vim.lsp.buf.rename_workspace_folder, '[W]orkspace: re[N]ame Folder')

                map('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[W]orkspace: [L]ist Folders')

                map(
                    'n',
                    '<leader>ef',
                    '<cmd>EslintFixAll<CR>',
                    '[E]slint [F]ix All'
                )

                map('n', '<leader>rs', ':LspRestart<CR>', '[R]e[S]tart LSP')

                -- create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(
                    event.buf,
                    'Format',
                    function(_)
                        vim.lsp.buf.format()
                    end,
                    { desc = 'Format current buffer with LSP' }
                )

                -- autocommands for highlighting references of words under cursor
                -- after the cursor rests for a while
                --      See `:help CursorHold` for info

                -- highlights will be cleared when cursor is moved
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client.server_capabilities.documentHighlightProvider
                then
                    local highlight_augroup = vim.api.nvim_create_augroup(
                        'UserLspHighlight',
                        { clear = false }
                    )
                    vim.api.nvim_create_autocmd(
                        { 'CursorHold', 'CursorHoldI' },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        }
                    )

                    vim.api.nvim_create_autocmd(
                        { 'CursorMoved', 'CursorMovedI' },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        }
                    )
                end

                -- autocmd to enable inlay hints
                -- may have undesired effects, might displace some code
                if
                    client
                    and client.server_capabilities.inlayHintProvider
                    and vim.lsp.inlay_hint
                then
                    map('n', '<leader>ht', function()
                        vim.lsp.inlay_hint.enable(
                            not vim.lsp.inlay_hint.is_enabled()
                        )
                    end, '[H]ints [T]oggle')
                end
            end,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup(
                'UserLspDetach',
                { clear = true }
            ),
            callback = function(event)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({
                    group = 'UserLspHighlight',
                    buffer = event.buf,
                })
            end,
        })
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.vue' },
            command = 'silent! EslintFixAll',
            group = vim.api.nvim_create_augroup(
                'MyAutocmdsJavaScripFormatting',
                {}
            ),
        })

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs =
            { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        -- adding cmp capabilities to lsp
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            'force',
            capabilities,
            cmp_nvim_lsp.default_capabilities()
        )

        -- setup mason and ensure all the default language servers are installed
        -- define custom server options, not necessary for most, using kickstart template
        local servers = {
            lua_ls = {
                -- cmd = {...},
                -- filetypes = {...},
                -- capabilities = {...},
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replave',
                        },
                        -- to ignore Lua_LS's noisy `missing-fields` warnings
                        diagnostics = {
                            disable = { 'missing-fields' },
                        },
                    },
                },
            },
            bashls = {},
            clangd = {},
            dockerls = {},
            eslint = {},
            gopls = {},
            ltex = {},
            pyright = {},
            rust_analyzer = {},
            jsonls = {},
            yamlls = {},
            tsserver = {},
            astro = {},
            svelte = {},
            volar = {},
            cssls = {},
            tailwindcss = {},
            html = {},
            htmx = {},
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
            'clang-format',
            'eslint_d',
            'prettier',
            'pylint',
            'isort',
            'black',
            'goimports',
            'golangci-lint',
            'shellcheck',
        })

        require('mason').setup({
            ui = {
                icons = {
                    package_pending = ' ',
                    package_installed = '󰄳 ',
                    package_uninstalled = ' 󰚌',
                },
            },
        })

        -- mason keymap
        vim.keymap.set(
            'n',
            '<leader>ma',
            vim.cmd.Mason,
            { noremap = true, silent = true, desc = '[M]ason [A]ction' }
        )

        require('mason-tool-installer').setup({
            ensure_installed = ensure_installed,
        })

        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}

                    server.capabilities = vim.tbl_deep_extend(
                        'force',
                        {},
                        capabilities,
                        server.capabilities or {}
                    )
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        })
    end,
}
