return {
  {
    'ggandor/leap.nvim',
    config = function()
      -- require('leap').create_default_mappings() -- These are manually set in the plugin folder instead.
      -- Leap
      vim.keymap.set('n', 's', "<Plug>(leap-forward)")
      vim.keymap.set('x', 's', "<Plug>(leap-forward)")
      vim.keymap.set('n', 'S', "<Plug>(leap-backward)")
      vim.keymap.set('x', 's', "<Plug>(leap-backward)")
    end,
  },
}
