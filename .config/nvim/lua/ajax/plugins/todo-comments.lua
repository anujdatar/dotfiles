return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo_comments = require('todo-comments')

    -- set keymaps
    vim.keymap.set('n', '<leader>dn', function()
      todo_comments.jump_next()
    end, { desc = 'To[D]o: Next comment' })

    vim.keymap.set('n', '<leader>dp', function()
      todo_comments.jump_prev()
    end, { desc = 'To[D]o: [P]revious comment' })

    todo_comments.setup()
  end,
}
