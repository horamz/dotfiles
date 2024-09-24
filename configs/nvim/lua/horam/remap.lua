vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- ZZ is op
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- -- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
vim.keymap.set({"n", "i"}, "<C-s>c", "<Esc><cmd>w<cr><Esc>")
vim.keymap.set({"n", "i"}, "<C-s>a", "<Esc><cmd>wa<cr><Esc>")
vim.keymap.set({"n", "v", "i", "o", "x"}, "<C-c>", "<Esc>")
--vim.keymap.set("n", "<leader>tr",  ":bel split | terminal <CR><C-w>7-", {noremap = true})

-- Windows
vim.keymap.set("n", "<A-h>", "<C-w>h");
vim.keymap.set("n", "<A-j>", "<C-w>j");
vim.keymap.set("n", "<A-k>", "<C-w>k");
vim.keymap.set("n", "<A-l>", "<C-w>l");

vim.keymap.set("n", "<leader>tr", "<cmd>vsplit | term<cr><C-W>L")
vim.keymap.set("n", "<leader>ts", "<cmd>split | term<cr><C-W>J14<C-W>-")

-- Buffers
vim.keymap.set("n", "<C-Right>", "<cmd>bn<cr>");
vim.keymap.set("n", "<C-Left>", "<cmd>bp<cr>");
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", {noremap = true, silent = true})
