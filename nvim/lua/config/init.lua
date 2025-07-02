vim.loader.enable()

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.ignorecase = true
vim.o.wrap = false
vim.o.so = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.undofile = true
vim.o.smartcase = true
vim.opt.termguicolors = true
vim.wo.signcolumn = "yes"
