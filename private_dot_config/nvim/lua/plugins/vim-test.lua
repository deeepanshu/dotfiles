return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
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
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-neotest/neotest-jest",
  --   },
  --   keys = {
  --     { "<leader>tn", ":TestNearest<CR>", desc = "Test Nearest" },
  --     { "<leader>tf", ":TestFile<CR>",    desc = "Test File" },
  --     { "<leader>ts", ":TestSuite<CR>",   desc = "Test Suite" },
  --     { "<leader>tl", ":TestLast<CR>",    desc = "Test Last" },
  --     { "<leader>tv", ":TestVisit<CR>",   desc = "Test Visit" },
  --   },
  --   config = function()
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-jest")({
  --           jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")) .. " --watch",
  --         }),
  --       },
  --       discovery = {
  --         enabled = false,
  --       },
  --     })
  --   end,
  -- },
}
