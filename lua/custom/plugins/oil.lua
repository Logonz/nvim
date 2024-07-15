-- Source from : https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/oil.lua
-- Oil Repo : https://github.com/stevearc/oil.nvim
return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", },
    config = function()
      require("oil").setup {
        columns = { "icon", },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["g."] = false,
          ["g\\"] = false,
          ["<M-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<Esc>"] = "actions.close",
          ["<M-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          padding = 10,
          max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
          preview_split = "right",
        },
      }

      -- Open parent directory in current window
      vim.keymap.set("n", "<Space>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory", })

      -- Open parent directory in floating window
      vim.keymap.set("n", "-", require("oil").toggle_float)
    end,
  },
}
