-- Status line plugin
-- https://github.com/nvim-lualine/lualine.nvim

local helpers = require("custom.helpers.helpers")

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- code found here: https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/lualine.lua
      -- lightweight replacement for fidget.nvim
      local progressText = ""
      local function lspProgress() return progressText end

      vim.api.nvim_create_autocmd("LspProgress", {
        callback = function(ctx)
          local clientName = vim.lsp.get_client_by_id(ctx.data.client_id).name
          local progress = ctx.data.params
              .value ---@type {percentage: number, title?: string, kind: string, message?: string}
          if not (progress and progress.title) then return end

          local icons = { "󰫃", "󰫄", "󰫅", "󰫆", "󰫇", "󰫈" }
          local idx = math.floor(#icons / 2)
          if progress.percentage == 0 then idx = 1 end
          if progress.percentage and progress.percentage > 0 then
            idx = math.ceil(progress.percentage / 100 * #icons)
          end
          local firstWord = vim.split(progress.title, " ")[1]:lower()

          local text = table.concat({ icons[idx], clientName, firstWord }, " ")
          progressText = progress.kind == "end" and "" or text
        end,
      })

      -- Source: https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/lualine.lua
      local function filenameAndIcon()
        local maxLength = 25 --CONFIG
        local name = vim.fs.basename(vim.api.nvim_buf_get_name(0))
        local display = #name < maxLength and name or vim.trim(name:sub(1, maxLength)) .. "…"
        local ok, devicons = pcall(require, "nvim-web-devicons")
        if not ok then return display end
        local extension = name:match("%w+$")
        local icon = devicons.get_icon(display, extension) or devicons.get_icon(display, vim.bo.ft)
        if not icon then return display end
        return icon .. " " .. display
      end

      local function get_last_folder(path)
        -- Lua pattern to match the last folder in a path
        local last_folder = path:match("([^/\\]+)[/\\]?$")
        return last_folder
      end

      local colors = pcall(require, "onedarkpro.helpers") and require("onedarkpro.helpers").get_colors() or
          require("tokyonight.colors").setup() or
          { fg = "#abb2bf", bg = "#282c34", red = "#f7768e" } --[[ This is onedarkpro hardcoded ]]


      require('lualine').setup({
        options = {
          ignore_focus = {}
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', { -- .venv indicator
            function()
              local venv_name = get_last_folder(vim.env.VIRTUAL_ENV)
              return "󱥒 (" .. venv_name .. ")"
            end,
            cond = function() return vim.env.VIRTUAL_ENV and vim.bo.ft == "python" end,
            padding = { left = 1, right = 0 },
          }, 'diff', 'diagnostics' },
          lualine_c = { function() return "Project: " .. require('auto-session.lib').current_session_name() end, filenameAndIcon }, -- 'filename'
          lualine_x = { lspProgress, 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        winbar = {
          lualine_a = { {
            'filename',
            path = 1,
            color = function(section)
              -- return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
              return { fg = colors.bg, bg = helpers.Blend_colors(colors.green, colors.bg, 0.9) }
            end,
            separator = {
              --left = '',
              right = ''
            },
          } },
          lualine_b = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        inactive_winbar = {
          lualine_a = {
            {
              'filename',
              path = 1,
              color = function(section)
                -- This was a test to see if i could change the colors when changed, it only returns the current buffer however
                -- return { fg = colors.bg, bg = vim.bo.modified and colors.red or colors.blue }
                return {
                  fg = helpers.Blend_colors(colors.bg, colors.fg, 0.1),
                  bg = helpers.Blend_colors(colors.blue,
                    colors.bg, 0.2)
                }
              end,
              separator = {
                --left = '',
                right = ''
              },
            },
          },
          lualine_b = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
      })
    end
  }
}
