return{
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true }, -- imports on file rename
        { 'folke/neodev.nvim', opts = {} }, -- better lsp for lua
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }, -- lsp status updates
        { 'williamboman/mason.nvim' }, -- mason
        { 'williamboman/mason-lspconfig.nvim' }, -- mason lsp
    },

    config= function()
        local lspconfig = require('lspconfig')
        local mason_lspconfig = require('mason-lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                otps.desc = '[R]e[N]ame'
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

                opts.desc = '[C]ode [A]ction'
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

                opts.desc = '[G]]o to [D]efinition'
                vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)

                opts.desc = '[G]o to [R]]eferences'
                vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)

                opts.desc = '[G]o to [I]mplementation'
                vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)

                opts.desc = '[G]o to [T]ype definition'
                vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts)

                opts.desc = '[G]o to [D]eclaration' -- not used often
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)

                opts.desc = 'Go to [D]ocument [S]ymbol'
                vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)

                opts.desc = 'Go to [W]orkspace [S]ymbol'
                vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

                opts.desc = 'Hover Documentation' -- shows documentation of hovered item
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

                opts.desc = 'Signature Documentation' -- shows signature of hovered item
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

                opts.desc = '[W]orkspace [A]dd folder'
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)

                opts.desc = '[W]orkspace [R]emove folder'
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)

                opts.desc = '[W]orkspace re[N]ame folder'
                vim.keymap.set('n', '<leader>wn', vim.lsp.buf.rename_workspace_folder, opts)

                opts.desc = '[W]orkspace [L]ist folders'
                vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts
                )

                opts.desc = '[E]slint [F]ix Formatting'
                vim.keymap.set('n', '<leader>ef', '<cmd>EslintFixAll<CR>', opts)

                opts.desc = '[R]e[S]tart LSP'
                vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)

                -- create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_)
                    vim.lsp.buf.format()
                    end, {desc = 'Format current buffer with LSP'}
                )
            end,

        })

        -- enable autocompletion (assign to every lsp server)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig(server_name).setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- enable completion
                        require('cmp_nvim_lsp').setup({ bufnr = bufnr })
                    end,
                })
            end,
        })
    end,
}
