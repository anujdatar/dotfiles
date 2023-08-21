local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.mapleader = ' '
g.maplocalleader = ' '
-- Disable Netrw at the start, using NvimTree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-------------------------------------- options ------------------------------------------
opt.termguicolors = true  -- enable highlight groups
opt.guicursor = ''  -- fat cursor
opt.mouse = 'a'  -- enable mouse
opt.clipboard = 'unnamedplus'  -- sync vim and OS clipboard
opt.breakindent = true  -- enable break indent
opt.completeopt = 'menuone,noselect'  -- better completion experience

-- Line numbering
opt.nu = true
opt.relativenumber = true

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Swap and undo history
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append('@-@')

opt.updatetime = 50

opt.wrap = false
opt.colorcolumn = '80'

-- Search, case-insensitive unless \C or capital in search
opt.ignorecase = true
opt.smartcase = true

