return {
  {
    'ggandor/leap.nvim',
    config = function()
      -- require('leap').create_default_mappings() -- These are manually set in the plugin folder instead.
      -- Leap
      -- vim.keymap.set('n', 's', "<Plug>(leap-forward)")

      -- Leap across all windows
      vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
        require('leap').leap {
          target_windows = require('leap.user').get_focusable_windows(),
        }
      end)
      -- vim.keymap.set('x', 's', "<Plug>(leap-forward)")
      -- vim.keymap.set('n', 'S', "<Plug>(leap-backward)")
      -- vim.keymap.set('x', 's', "<Plug>(leap-backward)")
      local function fix_colors()
        if vim.g.colors_name == "onedark" then
          -- Force using the defaults of Leap:
          require('leap').init_highlight(true)
          local colors = pcall(require, "onedarkpro.helpers") and require("onedarkpro.helpers").get_colors() or
              require("tokyonight.colors").setup() or
              { fg = "#abb2bf", bg = "#282c34", red = "#f7768e" } --[[ This is onedarkpro hardcoded ]]

          -- Colors of the documents when search is enabled (Gray out everything)
          vim.api.nvim_set_hl(0, 'LeapBackdrop',
            {
              -- link = 'Comment',
              -- fg = "#ccff88",
              -- bg = "#ccff88",
              fg = colors.comment,
              -- background = colors.bg,
              bg = colors.bg,
              -- underline = false,
              nocombine = true,
              ctermfg = "black",
              ctermbg = "red",
            }
          )
          vim.api.nvim_set_hl(0, 'LeapLabel', {
            bg = colors.bg,
            -- fg = colors.red,
            fg = "#FF4C00", -- The color of the "jump-to" character
            nocombine = true,
            -- underline = true,
            --
          })
          -- Not sure what this does...
          -- vim.api.nvim_set_hl(0, 'LeapMatch', {
          --   -- For light themes, set to 'black' or similar.
          --   -- fg = '#FF0000',
          --   -- bold = true,
          --   -- nocombine = true,
          --   -- bg = "#FF0000",
          --   -- bg = "#eef1f0",
          --   -- ctermfg = "black",
          --   -- ctermbg = "red"
          --   -- fg = "black",
          --   -- bg = "#ccff88",
          --   bg = "#ff0000",
          --   fg = "#00ff00",
          --   nocombine = true,
          --   ctermfg = "black",
          --   ctermbg = "black"
          -- })
        end
      end
      -- require("leap").init_highlight(true)
      -- require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = fix_colors
      })
      fix_colors()
    end,
  },
}
