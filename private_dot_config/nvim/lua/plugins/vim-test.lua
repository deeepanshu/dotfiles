return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      setKeymap("n", "<leader>Tn", "<cmd>TestNearest<CR>", "Test nearest")
      setKeymap("n", "<leader>Tf", "<cmd>TestFile<CR>", "Test File")
      setKeymap("n", "<leader>Ts", "<cmd>TestSuite<CR>", "Test All/Suite")
      setKeymap("n", "<leader>Tl", "<cmd>TestLast<CR>", "Test last")
      setKeymap("n", "<leader>Tv", "<cmd>TestVisit<CR>", "Test visit")
      vim.cmd("let test#strategy = 'vimux'")
    end,
  },
}
