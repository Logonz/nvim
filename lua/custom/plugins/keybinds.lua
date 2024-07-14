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

-- Pasting over a selected word does not change copy buffer (aka it stays the same)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copying to OS clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "▌ Yank to System Clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "▌ Yank to System Clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "▌ Rest of line Yank to System Clipboard" }) -- Copy to the end of the line
vim.keymap.set("n", "<leader><C-p>", "\"+p", { desc = "▌ Paste from System Clipboard" })
vim.keymap.set("v", "<leader><C-p>", "\"+p", { desc = "▌ Paste from System Clipboard" })
-- vim.keymap.set("i", "<C-P>", "<CMD>\"+p<CR>", { desc = "Paste from System Clipboard" }) -- This does not work, use CTRL+R (registers) -> + (system-r) instead

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
