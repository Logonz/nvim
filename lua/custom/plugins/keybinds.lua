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
local map = vim.keymap.set
-- Insert keybinds
-- This adds undo to insert
-- map('i', '<C-z>', function() vim.cmd("undo") end)
map('i', '<C-z>', "<CMD>undo<CR>")
map('i', '<C-s>', "<Esc><CMD>w<CR>", { desc = "▌ Exit insert mode and [S]ave" })
map('i', '<Home>', "<C-o>^") -- <C-o> enters "one-command" mode allowing one normal command before going back to insert

-- Normal keybinds
map('n', '<C-q>', "<CMD>q<CR>", { desc = "▌ Quit current buffer" })
map('n', '<C-s>', "<CMD>w<CR>", { desc = "▌ [S]ave" })
map('n', '<Home>', "^")
map('n', "<leader>'", "<Plug>(comment_toggle_linewise_current)",
  { remap = true, desc = "▌ Comment current line" })

-- Visual keybinds
map('x', "<leader>'", "<Plug>(comment_toggle_linewise_visual)",
  { remap = true, desc = "▌ Comment selected lines" })
map('v', 'J', ":m '>+1<CR>gv=gv") -- This binding makes it so that if you have multiple lines selected you can move them using J
map('v', 'K', ":m '<-2<CR>gv=gv") -- This binding makes it so that if you have multiple lines selected you can move them using K

-- Pasting over a selected word does not change copy buffer (aka it stays the same)
map("x", "<leader>p", "\"_dP")

-- Copying to OS clipboard
map("n", "<leader>y", "\"+y", { desc = "▌ Yank to System Clipboard" })
map("v", "<leader>y", "\"+y", { desc = "▌ Yank to System Clipboard" })
map("n", "<leader>Y", "\"+Y", { desc = "▌ Rest of line Yank to System Clipboard" }) -- Copy to the end of the line
map("n", "<leader><C-p>", "\"+p", { desc = "▌ Paste from System Clipboard" })
map("v", "<leader><C-p>", "\"+p", { desc = "▌ Paste from System Clipboard" })
-- map("i", "<C-P>", "<CMD>\"+p<CR>", { desc = "Paste from System Clipboard" }) -- This does not work, use CTRL+R (registers) -> + (system-r) instead

-- Search
--
-- Search for sessions which are kind of like "project" and kind of like "folders" baked into one!
map("n", "<leader>sp", require("auto-session.session-lens").search_session, {
  desc = "▌[S]earch [P]roject",
  noremap = true,
})


-- Undo specific rebinds, it makes it so that multiple undo points are created for the characters below
--
local opts = { noremap = true, silent = true, }
map('i', ',', ',<C-G>u', opts)
map('i', '.', '.<C-G>u', opts)
map('i', ';', ';<C-G>u', opts)
map('i', ':', ':<C-G>u', opts)
map('i', ']', ']<C-G>u', opts)
map('i', ')', ')<C-G>u', opts)
map('i', '[', '[<C-G>u', opts)
map('i', ']', ']<C-G>u', opts)
map('i', '{', '{<C-G>u', opts)
map('i', '}', '}<C-G>u', opts)
map('i', '=', '=<C-G>u', opts)
map('i', "'", "'<C-G>u", opts) -- '
map('i', '"', '"<C-G>u', opts) -- "
map('i', '<Space>', '<Space><C-G>u', opts)
-- map('i', '<Tab>', '<Tab><C-G>u', opts)
map('i', '<CR>', '<CR><C-G>u', opts)

opts = { silent = true }

map('n', '<leader>1', function() require('bufferline').go_to(1, true) end, opts)
map('n', '<leader>2', function() require('bufferline').go_to(2, true) end, opts)
map('n', '<leader>3', function() require('bufferline').go_to(3, true) end, opts)
map('n', '<leader>4', function() require('bufferline').go_to(4, true) end, opts)
map('n', '<leader>5', function() require('bufferline').go_to(5, true) end, opts)
map('n', '<leader>6', function() require('bufferline').go_to(6, true) end, opts)
map('n', '<leader>7', function() require('bufferline').go_to(7, true) end, opts)
map('n', '<leader>8', function() require('bufferline').go_to(8, true) end, opts)
map('n', '<leader>9', function() require('bufferline').go_to(9, true) end, opts)
-- map('n', '<leader>$', function() require('bufferline').go_to(-1, true) end, opts)


return {}
