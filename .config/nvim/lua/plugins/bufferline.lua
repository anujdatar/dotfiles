return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        enabled = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            options = {
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
    },
}

