-- For multiple cursor select like vscode https://github.com/mg979/vim-visual-multi

return {
  {
    'mg979/vim-visual-multi',
    config = function()
      vim.keymap.set('n', '<C-d>', "<Plug>(VM-Find-Under)")
      vim.keymap.set('x', '<C-d>', "<Plug>(VM-Find-Subword-Under)")
    end
  }
}
