return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    keys = {
      { "n", "<leader>tn" },
      { "n", "<leader>tf" },
      { "n", "<leader>ts" },
      { "n", "<leader>tl" },
      { "n", "<leader>tv" },
    },
    config = function()
      setKeymap("n", "<leader>tn", "<cmd>TestNearest<CR>", "Test nearest")
      setKeymap("n", "<leader>tf", "<cmd>TestFile<CR>", "Test File")
      setKeymap("n", "<leader>ts", "<cmd>TestSuite<CR>", "Test All/Suite")
      setKeymap("n", "<leader>tl", "<cmd>TestLast<CR>", "Test last")
      setKeymap("n", "<leader>tv", "<cmd>TestVisit<CR>", "Test visit")
      vim.cmd("let test#strategy = 'vimux'")
    end,
  },
}
