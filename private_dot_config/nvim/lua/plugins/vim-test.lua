return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      vim.keymap.set("n", "<leader>Tn", ":TestNearest<CR>")
      vim.keymap.set("n", "<leader>Tf", ":TestFile<CR>")
      vim.keymap.set("n", "<leader>Ts", ":TestSuite<CR>")
      vim.keymap.set("n", "<leader>Tl", ":TestLast<CR>")
      vim.keymap.set("n", "<leader>Tv", ":TestVisit<CR>")
      vim.cmd("let test#strategy = 'vimux'")
    end,
  },
}
