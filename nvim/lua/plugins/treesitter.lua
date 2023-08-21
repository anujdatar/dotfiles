return {
    {
        -- Syntax highliting and code navigation
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                init = function()
                    -- disable rtp plugin, as we only need its queries for mini.ai
                    -- In case other textobject modules are enabled, we will load them
                    -- once nvim-treesitter is loaded
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    load_textobjects = true
                end,
            },
        },
        build = ':TSUpdate',
        opts = {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                'c',
                'cpp',
                'css',
                'dockerfile',
                'go',
                'html',
                'javascript',
                'lua',
                'markdown',
                'markdown_inline',
                'python',
                'rust',
                'tsx',
                'typescript',
                'vim',
                'vimdoc',
                'yaml',
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
