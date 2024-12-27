return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      setKeymap("n", "<leader>e", "<CMD>Oil<CR>", "Open parent directory")
    end
  }
}
