-- Tree file viewer
-- https://github.com/nvim-tree/nvim-tree.lua


return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({

      })
      local api = require("nvim-tree.api")


      vim.keymap.set('n', '§', function()
        api.tree.toggle({
          find_file = true,
        })
      end)
      -- api.tree.open({
      --   find_file = true,
      -- })
      -- api.tree.reload()
    end,
  },
}
