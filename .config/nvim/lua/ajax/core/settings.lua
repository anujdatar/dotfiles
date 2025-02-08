vim.cmd('let g:netrw_liststyle = 3')

local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.mapleader = ' '
g.maplocalleader = ' '
-------------------------------------- options ------------------------------------------
opt.cursorline = true -- highlight current line
opt.termguicolors = true -- enable highlight groups
opt.background = 'dark' -- set background to dark, if colorscheme supports both
opt.signcolumn = 'yes' -- always show signcolumn, so text dowsn't jump
-- opt.guicursor = ''  -- fat cursor
opt.mouse = 'a' -- enable mouse
opt.mousemoveevent = true
opt.clipboard = 'unnamedplus' -- sync vim and OS clipboard
opt.breakindent = true -- enable break indent
opt.completeopt = 'menuone,noselect' -- better completion experience

-- Line numbering
opt.nu = true
opt.relativenumber = true

-- Indenting
opt.tabstop = 4 -- spaces for tabs
opt.softtabstop = 4 -- spaces for tabs
opt.shiftwidth = 4 -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- autoindent new lines
opt.autoindent = true -- copy indent from current line to new line

opt.wrap = false
opt.colorcolumn = '80'

-- Swap and undo history
opt.swapfile = false
opt.backup = false
-- opt.undodir = os.getenv('HOME') .. '/.vim/undodir' -- for linux
-- opt.undodir = os.getenv('UserProfile') .. '/.vim/undodir' -- for windows
opt.undodir = (os.getenv('HOME') or os.getenv('UserProfile') .. '/.vim/undodir' -- for both maybe
opt.undofile = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append('@-@')

opt.updatetime = 50

-- Search, case-insensitive unless \C or capital in search
opt.ignorecase = true -- ignore case in search
opt.smartcase = true -- if there is a capital letter, case-sensitive

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
