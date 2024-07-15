-- Adds tabs at the top of the buffers
--


return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bl = require("bufferline")
      require("bufferline").setup({
        options = {
          show_close_icon = false,
          show_buffer_close_icons = false,

          offsets = {
            -- Do not overlap the tab-bar over the File Explorer
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true -- use a "true" to enable the default, or set your own character
            }
          },
          -- sort_by = sort_by_relative_directory,
          -- TODO: Implement smart-tabs sorting
          -- sort_by = function(buffer_a, buffer_b)
          --   -- info here https://github.com/akinsho/bufferline.nvim/blob/main/lua/bufferline/commands.lua
          --   -- vim.api.nvim_get_current_buf() to get current buffer id
          --   local state = require("bufferline.state")
          --   local file = io.open("/home/logon/bufferline-test/" .. buffer_a.name .. ".txt", "w")
          --
          --   for k, v in pairs(buffer_a) do
          --     file:write(tostring(k) .. " ")
          --     file:write(tostring(v) .. "\n")
          --     -- print(k, v)
          --   end
          --   file:close()
          --   -- print(buffer_a.modified)
          --   -- print(vim.fn.getftime(buffer_a.path))
          --   -- vim.inspect(buffer_a)
          --   -- add custom logic
          --   -- return true
          --   if buffer_a and not buffer_b then return false end
          --   if buffer_b and not buffer_a then return true end
          --   return vim.fn.getftime(buffer_a.path) > vim.fn.getftime(buffer_b.path)
          -- end,
          name_formatter = function(buf)
            -- buf contains:
            -- name                | str        | the basename of the active file
            -- path                | str        | the full path of the active file
            -- bufnr (buffer only) | int        | the number of the active buffer
            -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
            -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
            local elements = bl.get_elements().elements
            local name = buf.name
            local tab_idx = 0
            for tab_index, tab in pairs(elements) do
              -- print(tab_index, tab.name)
              local tabname = tab.name:gsub("^%d+%s*", "")
              if tabname == name then
                tab_idx = tab_index
                break
              end
            end
            return tostring(tab_idx) .. " " .. name
          end,
        }
      })
    end
  }
}
