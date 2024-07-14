-- Here we have general keybinds
-- Default: `▎` ~
-- Alternatives: ~
-- • left aligned solid
--  • `▏`
--  • `▎` (default)
--  • `▍`
--  • `▌`
--  • `▋`
--  • `▊`
--  • `▉`
--  • `█`
-- • center aligned solid
--  • `│`
--  • `┃`
-- • right aligned solid
--  • `▕`
--  • `▐`
-- • center aligned dashed
--  • `╎`
--  • `╏`
--  • `┆`
--  • `┇`
--  • `┊`
--  • `┋`
-- • center aligned double
--  • `║`
--
-- Insert keybinds
-- This adds undo to insert
-- vim.keymap.set('i', '<C-z>', function() vim.cmd("undo") end)
vim.keymap.set('i', '<C-z>', "<CMD>undo<CR>")
vim.keymap.set('i', '<C-s>', "<Esc><CMD>w<CR>", { desc = "▌ Exit insert mode and [S]ave" })
vim.keymap.set('i', '<Home>', "<C-o>^") -- <C-o> enters "one-command" mode allowing one normal command before going back to insert

-- Normal keybinds
vim.keymap.set('n', '<C-q>', "<CMD>q<CR>", { desc = "▌ Quit current buffer" })
vim.keymap.set('n', '<C-s>', "<CMD>w<CR>", { desc = "▌ [S]ave" })
vim.keymap.set('n', '<Home>', "^")
vim.keymap.set('n', "<leader>'", "<Plug>(comment_toggle_linewise_current)",
  { remap = true, desc = "▌ Comment current line" })

-- Visual keybinds
vim.keymap.set('x', "<leader>'", "<Plug>(comment_toggle_linewise_visual)",
  { remap = true, desc = "▌ Comment selected lines" })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- This binding makes it so that if you have multiple lines selected you can move them using J
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- This binding makes it so that if you have multiple lines selected you can move them using K

-- Undo specific rebinds, it makes it so that multiple undo points are created for the characters below
--
local opts = { noremap = true, silent = true, }
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
