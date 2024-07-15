-- Indent blankline https://github.com/lukas-reineke/indent-blankline.nvim
-- Used to provide indent colorization
-- :help ibl.config

local helpers = require("custom.helpers.helpers")

return {
  {
    -- source https://gitlab.com/HiPhish/rainbow-delimiters.nvim
    "HiPhish/rainbow-delimiters.nvim"
  },
  {

    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      -- Get The Theme color
      local colors = pcall(require, "onedarkpro.helpers") and require("onedarkpro.helpers").get_colors() or
          require("tokyonight.colors").setup() or
          { fg = "#abb2bf", bg = "#282c34" } --[[ This is onedarkpro hardcoded ]]
      local hooks = require("ibl.hooks")

      -- List of colors, a dark color is created automatically from this
      local color_list = {
        {
          name = "RainbowRed",
          fg = "#E06C75",
        },
        {
          name = "RainbowYellow",
          fg = "#E5C07B",
        },
        {
          name = "RainbowBlue",
          fg = "#61AFEF",
        },
        {
          name = "RainbowOrange",
          fg = "#D19A66",
        },
        {
          name = "RainbowGreen",
          fg = "#98C379",
        },
        {
          name = "RainbowViolet",
          fg = "#C678DD",
        },
        {
          name = "RainbowCyan",
          fg = "#56B6C2",
        },
      }

      -- Create the color lists for scope and indent
      local highlight = {}
      local indent = {}
      for _, color in pairs(color_list) do
        table.insert(highlight, color.name)
        table.insert(indent, color.name .. "Dark")
      end

      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        for _, color in pairs(color_list) do
          vim.api.nvim_set_hl(0, color.name, { fg = color.fg })
          vim.api.nvim_set_hl(0, color.name .. "Dark", { fg = helpers.Blend_colors(color.fg, colors.bg, 0.2) })
        end
      end)

      -- require("ibl").setup({ indent = { highlight = highlight } })
      -- vim.g.rainbow_delimiters = { highlight = highlight }

      require('rainbow-delimiters.setup').setup({
        highlight = highlight,
      })
      require("ibl").setup {
        scope = {
          highlight = highlight,
          enabled = true,
        },
        indent = {
          highlight = indent,
          char = "▏",
        },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  }
}
