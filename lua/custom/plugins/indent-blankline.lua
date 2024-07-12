-- Indent blankline https://github.com/lukas-reineke/indent-blankline.nvim
-- Used to provide indent colorization
-- :help ibl.config

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
      -- Function to convert hex color to RGB
      local function hex_to_rgb(hex)
        hex = hex:gsub("#", "")
        return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
      end

      -- Function to convert RGB to hex color
      local function rgb_to_hex(r, g, b)
        return string.format("#%02x%02x%02x", r, g, b)
      end

      -- Function to blend two colors
      local function blend_colors(color1, color2, ratio)
        local r1, g1, b1 = hex_to_rgb(color1)
        local r2, g2, b2 = hex_to_rgb(color2)

        local r = r1 * ratio + r2 * (1 - ratio)
        local g = g1 * ratio + g2 * (1 - ratio)
        local b = b1 * ratio + b2 * (1 - ratio)

        return rgb_to_hex(math.floor(r), math.floor(g), math.floor(b))
      end
      -- Get The Theme color
      local colors = require("tokyonight.colors").setup()
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
          vim.api.nvim_set_hl(0, color.name .. "Dark", { fg = blend_colors(color.fg, colors.bg, 0.2) })
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
