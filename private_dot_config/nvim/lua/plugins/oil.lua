return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup()
      setKeymap("n", "<leader>e", "<CMD>Oil<CR>", "Open parent directory")
    end
  }
}

-- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons",
--       "MunifTanjim/nui.nvim",
--     },
--     keys = {
--       {
--         "<leader>fe",
--         function()
--           require("neo-tree.command").execute({ toggle = true })
--         end,
--         desc = "Explorer NeoTree (root)",
--       },
--     },
--     config = function()
--       require("neo-tree").setup({
--         sources = { "filesystem", "buffers", "git_status", "document_symbols" },
--         source_selector = {
--           sources = {
--             { source = "filesystem" },
--             { source = "document_symbols" },
--             { source = "buffers" },
--             { source = "git_status" },
--           },
--         },
--         document_symbols = {
--           follow_cursor = true,
--         },
--         filesystem = {
--           bind_to_cwd = false,
--           filtered_items = {
--             hide_by_pattern = {
--               "*.iml",
--             },
--             always_show = {
--               ".gitlab",
--               ".gitignore",
--               ".gitlab-ci.yml",
--               ".config",
--               ".local",
--               "target",
--             },
--             never_show = {
--               ".DS_Store",
--             },
--           },
--           follow_current_file = {
--             enabled = true,
--           },
--           group_empty_dirs = true,
--           scan_mode = "deep",
--           use_libuv_file_watcher = true,
--         },
--         open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
--         close_if_last_window = false,
--         indent_marker = "│",
--         window = { width = 30 },
--       })
--     end,
--   },
-- }
