-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Insert keybinds
-- This adds undo to insert
vim.keymap.set('i', '<C-z>', function() vim.cmd("undo") end)

-- Normal keybinds
vim.keymap.set('n', '<C-q>', function() vim.cmd("q") end)

-- Undo specific rebinds, it makes it so that multiple undo points are created for the characters below
--
local opts = { noremap = true, silent = true }
vim.keymap.set('i', ',', ',<C-G>u', opts)
vim.keymap.set('i', '.', '.<C-G>u', opts)
vim.keymap.set('i', ';', ';<C-G>u', opts)
vim.keymap.set('i', ':', ':<C-G>u', opts)
vim.keymap.set('i', ']', ']<C-G>u', opts)
vim.keymap.set('i', ')', ')<C-G>u', opts)
vim.keymap.set('i', '[', '[<C-G>u', opts)
vim.keymap.set('i', ']', ']<C-G>u', opts)
vim.keymap.set('i', '{', '{<C-G>u', opts)
vim.keymap.set('i', '}', '}<C-G>u', opts)
vim.keymap.set('i', '=', '=<C-G>u', opts)
vim.keymap.set('i', "'", "'<C-G>u", opts) -- '
vim.keymap.set('i', '"', '"<C-G>u', opts) -- "
vim.keymap.set('i', '<Space>', '<Space><C-G>u', opts)
-- vim.keymap.set('i', '<Tab>', '<Tab><C-G>u', opts)
vim.keymap.set('i', '<CR>', '<CR><C-G>u', opts)

return {}
