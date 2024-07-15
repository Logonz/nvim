-- Smart open changes how open file works, it becomes more tuned to how you like to open files etc.
--
--

return {
  "kkharji/sqlite.lua", -- Depencency
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
    -- { "nvim-telescope/telescope-fzy-native.nvim" },
  },
}
