return {
    'vimwiki/vimwiki',
    init = function()
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_list = {{
            path = '/media/anuj/Data/Notes/taskwiki',
            syntax = 'markdown',
            ext = '.md',
        }}
    end,
}
