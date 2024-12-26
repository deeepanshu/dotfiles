return {
  {
    "rmagatti/auto-session",
    config = function()
      local auto_session = require("auto-session")
      auto_session.setup({
        auto_create = false,
        auto_save = true,
        auto_restore = true,
        lazy_support = true,
        use_git_branch = true,
        show_auto_restore_notif = true,
        auto_restore_last_session = true,
        allowed_dirs = {"~/.config/", "~/Desktop/projects/"},
        session_lens = {
          load_on_setup = true,
          previewer = true,
        },
      })
      setKeymap("n", "<leader>wf", "<cmd>SessionSearch<CR>", "Search Session")
      setKeymap("n", "<leader>wr", "<cmd>SessionRestore<CR>", "Restore session for cwd")
      setKeymap("n", "<leader>ws", "<cmd>SessionSave<CR>", "Save session for auto-session root dir")
    end,
  },
}
