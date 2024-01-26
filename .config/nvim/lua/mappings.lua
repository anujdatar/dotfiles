local set = vim.keymap.set

-- escape sequences from insert mode
set('i', 'jj', '<Esc>')
set('i', 'kk', '<Esc>')
set('i', 'jk', '<Esc>')
set('i', 'kj', '<Esc>')

-- window/pane splitting
set('n', '<leader>sv', '<cmd>vs<CR>', { desc = '[S]plit window [V]ertically' })
set('n', '<leader>sh', '<cmd>sp<CR>', { desc = '[S]plit window [H]orizontally' })

-- general command mappings
set('n', '<leader>;', ':', { desc = 'Enter command mode', nowait = true })
-- set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Exit to Netrw' })  -- netrw disabled for now
set('n', 'Q', '<nop>', { desc = 'No operation, Q bad?' })
set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit or close current buffer' })
set('n', '<leader>wq', '<cmd>wq<CR>', { desc = '[W]rite current buffer and [Q]uit' })
set('n', '<leader>x', "<cmd>!chmod +x %<cr>", { desc = 'Make current file executable', silent = true })
set(
    { 'n', 'v', 'i' },
    '<C-s>',
    '<cmd>w<CR>',
    { desc = 'Write current buffer' }
)

-- navigation related
-- handle j and k movement when wrapped lines are present
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Move down one line', expr = true, silent = true })
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Move down up line', expr = true, silent = true })
set('n', '<C-d>', '<C-d>zz', { desc = 'Half page jump down' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Half page jump up' })

set('n', 'n', 'nzzzv', { desc = 'Search up, keep cursor in page middle' })
set('n', 'N', 'Nzzzv', { desc = 'Search down, keep cursor in page middle' })

-- copy paste delete related
set('n', '<leader>y', [["+y]], { desc = 'Cop[Y] selection to system clipboard' })
set('v', '<leader>y', [["+y]], { desc = 'Cop[Y] selection to system clipboard' })
set('n', '<leader>Y', [["+Y]], { desc = 'Cop[Y] line to system clipboard' })
set('v', '<leader>Y', [["+Y]], { desc = 'Cop[Y] line to system clipboard' })

set('x', '<leader>p', [["_dP]], { desc = '[P]aste over selection, no copy' })

set('n', '<leader>d', [["_d]], { desc = '[D]elete to void register' })
set('v', '<leader>d', [["_d]], { desc = '[D]elete to void register' })

set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace current word' })

set('n', 'J', "mzJ`z", { desc = "Append next line, don't move cursor" })
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line down' })
set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move selected line up' })

-- undotree
set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open [U]ndotree dialog' })

-- harpoon
set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon: [A]ppend file to list' })
set('n', '<leader>ht', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon: [T]oggle quick menu' })
set('n', '<leader>hn', require('harpoon.ui').nav_next, { desc = '[H]arpoon: [N]ext file' })
set('n', '<leader>hp', require('harpoon.ui').nav_prev, { desc = '[H]arpoon: [P]revious file' })

-- fugitive
set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status?' })

-- comment
set('n', '<leader>/', require('Comment.api').toggle.linewise.current, { desc = 'Toggle comment on current line' })
set('v', '<leader>/', require('Comment.api').toggle.linewise.current, { desc = 'Toggle comment on current line' })

-- telescope
set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
set('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = '[F]ind [A]ll files' })
set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind [B]uffers' })
set('n', '<leader>fz', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Fuzzily [F]ind in current [B]uffers' })
set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = '[F]ind recently [O]pened files' })
set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp tags' })
set('n', '<leader>fm', require('telescope.builtin').marks, { desc = '[F]ind book[M]arks' })

set('n', '<leader>fr', require('telescope.builtin').registers, { desc = '[F]ind [R]egisters' })
set('n', '<leader>fl', require('telescope.builtin').loclist, { desc = '[F]ind [L]ocation list' })
set('n', '<leader>fs', require('telescope.builtin').spell_suggest, { desc = '[F]ind [S]pell suggestions' })
set('n', '<leader>fc', require('telescope.builtin').commands, { desc = '[F]ind [C]ommands' })
set('n', '<leader>fq', require('telescope.builtin').quickfix, { desc = '[F]ind [Q]uickfix' })

set('n', '<leader>tf', require('telescope.builtin').git_files, { desc = '[T]elescope: [G]it Files' })
set('n', '<leader>tc', require('telescope.builtin').git_commits, { desc = '[T]elescope: Search Git [C]ommits' })
set('n', '<leader>tb', require('telescope.builtin').git_branches, { desc = '[T]elescope: Search Git [B]ranches' })
set('n', '<leader>ts', require('telescope.builtin').git_status, { desc = '[T]elescope: Search Git [S]tatus' })

-- mason
set('n', '<leader>ma', vim.cmd.Mason, { desc = 'Launch [M]ason' })
set('n', '<leader>mi', vim.cmd.MasonInstallAll, { desc = '[M]ason [I]nstall all' })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- NvimTree
set('n', '<leader>tt', vim.cmd.NvimTreeToggle, { desc = '[T]oggle Nvim[T]ree' })
set('n', '<leader>tr', vim.cmd.NvimTreeRefresh, { desc = 'Nvim[T]ree [R]efresh' })
set('n', '<leader>tf', vim.cmd.NvimTreeFocus, { desc = 'Nvim[T]ree [F]ocus' })

-- bufferline.nvim bindings
-- set('n', '<leader>b', vim.cmd.BufferLinePick, { desc = 'Pick a [B]uffer to move to'})
