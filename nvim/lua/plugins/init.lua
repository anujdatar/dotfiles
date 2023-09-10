-- lsp and mason, with default language servers
return {
    { 'folke/lazy.nvim', defaults = { lazy = false } },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'christoomey/vim-tmux-navigator' },
    -- Git plugins
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },

    -- Detect tabstops and shiftwidths automatically
    'tpope/vim-sleuth',
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    { 'theprimeagen/harpoon' },
    { 'mbbill/undotree' },
    {
        -- Theme
        'navarasu/onedark.nvim',
        priority = 1000,
        -- config = function()
            -- vim.cmd.colorscheme 'onedark'
        -- end,
    },
    {
        -- Theme
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'tokyonight'
        end,
    },
    {
        -- Theme
        'rebelot/kanagawa.nvim',
        priority = 1000,
        -- config = function()
            -- vim.cmd.colorscheme 'kanagawa'
        -- end,
    },
    {
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
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },
    -- This shows pending keybinds
    { 'folke/which-key.nvim', opts = {}, },
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup {}
        end,
    },
}

