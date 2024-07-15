-- A plugin used to store sessions (Kind of like project sessions in vscode)
--
--

return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      require('auto-session').setup({
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        close_unsupported_windows = true,    -- boolean: Close windows that aren't backed by normal file
        auto_session_use_git_branch = false, -- boolean: Use the git branch to differentiate the session name
        post_cwd_changed_hook = function()   -- example refreshing the lualine status line _after_ the cwd changes
          require("lualine").refresh()       -- refresh lualine so the new session name is displayed in the status bar
        end,
      })
    end,
  },
}
