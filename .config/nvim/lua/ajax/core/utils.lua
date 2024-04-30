local M = {}

M.set_keymap = function(mode, key, cmd, description, bufr)
    local options = { noremap = true, silent = true }
    if description then
        options = vim.tbl_extend('force', options, { desc = description })
    end
    if bufr then
        options = vim.tbl_extend('force', options, { buffer = bufr })
    end
    vim.keymap.set(mode, key, cmd, options)
end

M.test = function(str)
    print(str)
end

return M
