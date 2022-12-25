local g = vim.g
local o = vim.o
local opt = vim.opt

--colors
o.termguicolors = true

-- number of lines above and below cursor 
o.scrolloff = 5

-- ui
o.showmode = false
o.number = true
o.relativenumber = true
o.numberwidth = 2

-- editing
vim.cmd [[autocmd BufNewFile,BufRead * setlocal formatoptions-=ro]]
o.autochdir = false
o.expandtab = true
o.smarttab = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1
o.cindent = true
o.autoindent = true

-- allow new file explorer
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- mouse
opt.mouse = "a"

-- makes clipboard better somehow idk how
o.clipboard = 'unnamedplus'

-- Case sensitive seaching unless /C in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.swapfile = false
o.history = 50
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

--split options
o.splitright = true
o.splitright = true

-- map space to leader
g.mapleader = ' '
g.maplocalleader = ' '
