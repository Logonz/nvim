-- Automatically indents why you create a new line
-- This plugin makes it so that if you are standing on column 1 and press tab it will indent the whole way not just once.
return {
  {
    'vidocqh/auto-indent.nvim',
    opts = {
      ---@param lnum number
      ---@return number
      indentexpr = function(lnum)
        return require("nvim-treesitter.indent").get_indent(lnum)
      end
    },
  },
}
