local set = vim.keymap.set

-- escape sequences from insert mode
set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })
set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })
set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })
set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })

-- clear search highlights
set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- increment/decrement numbers
set('n', '<leader>+', '<C-a>', { desc = 'Increment [+] number' })
set('n', '<leader>-', '<C-x>', { desc = 'Decrement [-] number' })

-- window/pane splitting
set('n', '<leader>sv', '<cmd>vs<CR>', { desc = '[S]plit window [V]ertically' })
set(
    'n',
    '<leader>sh',
    '<cmd>sp<CR>',
    { desc = '[S]plit window [H]orizontally' }
)
set('n', '<leader>se', '<C-w>=', { desc = 'Make [S]plits [E]qual size' })
set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Basic movement keybinds, these make navigating splits easy for me
set('n', '<c-h>', '<c-w><c-h>') -- move to left pane
set('n', '<c-j>', '<c-w><c-j>') -- move to pane below
set('n', '<c-k>', '<c-w><c-k>') -- move to pane above
set('n', '<c-l>', '<c-w><c-l>') -- move to right pane
-- These mappings control the size of splits (height/width)
set('n', '<M-,>', '<c-w>5<') -- make pane narrower
set('n', '<M-.>', '<c-w>5>') -- make pane wider
set('n', '<M-t>', '<C-W>+') -- make pane taller
set('n', '<M-s>', '<C-W>-') -- make pane shorter

-- tab related
-- set('n', '<leader>bo', '<cmd>tabnew<CR>', { desc = 'Ta[B] [O]pen new' })
-- set('n', '<leader>bx', '<cmd>tabclose<CR>', { desc = 'Ta[B] close [X]' })
-- set('n', '<leader>bn', '<cmd>tabnext<CR>', { desc = 'Ta[B] [N]ext' })
-- set('n', '<leader>bp', '<cmd>tabprevious<CR>', { desc = 'Ta[B] [P]revious' })
-- set('n', '<leader>bf', '<cmd>tabnew %<CR>', { desc = 'Ta[B] open current bu[F]fer in new tab' })

-- general command mappings
set('n', '<leader>;', ':', { desc = 'Enter command mode', nowait = true })
set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Exit to Netrw' }) -- netrw disabled for now
set('n', 'Q', '<nop>', { desc = 'No operation, Q bad?' })
set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit or close current buffer' })
set(
    'n',
    '<leader>wq',
    '<cmd>wq<CR>',
    { desc = '[W]rite current buffer and [Q]uit' }
)
set(
    'n',
    '<leader>x',
    '<cmd>!chmod +x %<cr>',
    { desc = 'Make current file executable', silent = true }
)
set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'Write current buffer' })

-- navigation related
-- handle j and k movement when wrapped lines are present
set(
    'n',
    'j',
    "v:count == 0 ? 'gj' : 'j'",
    { desc = 'Move down one line', expr = true, silent = true }
)
set(
    'n',
    'k',
    "v:count == 0 ? 'gk' : 'k'",
    { desc = 'Move down up line', expr = true, silent = true }
)
set('n', '<C-d>', '<C-d>zz', { desc = 'Half page jump down' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Half page jump up' })

set('n', 'n', 'nzzzv', { desc = 'Search up, keep cursor in page middle' })
set('n', 'N', 'Nzzzv', { desc = 'Search down, keep cursor in page middle' })

-- copy paste delete related
set(
    { 'n', 'v' },
    '<leader>y',
    [["+y]],
    { desc = 'Cop[Y] selection to system clipboard' }
)
-- set('v', '<leader>y', [["+y]], { desc = 'Cop[Y] selection to system clipboard' })

set(
    { 'n', 'v' },
    '<leader>Y',
    [["+Y]],
    { desc = 'Cop[Y] line to system clipboard' }
)
-- set('v', '<leader>Y', [["+Y]], { desc = 'Cop[Y] line to system clipboard' })

set('x', '<leader>p', [["_dP]], { desc = '[P]aste over selection, no copy' })

set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[D]elete to void register' })
-- set('v', '<leader>d', [["_d]], { desc = '[D]elete to void register' })

set(
    'n',
    '<leader>s',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Replace current word' }
)

set('n', 'J', 'mzJ`z', { desc = "Append next line, don't move cursor" })
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line down' })
set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move selected line up' })

-- Diagnostic keymaps
set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'Go to previous diagnostic message' }
)
set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = 'Go to next diagnostic message' }
)
set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' }
)
-- set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- set('n', '<leader>Df', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'List all diagnostics for current buffer' })
