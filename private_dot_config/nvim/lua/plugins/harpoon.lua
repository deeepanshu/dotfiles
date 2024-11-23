return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon.setup({})

      setKeymap("n", "<leader>ha", function()
        harpoon:list():add()
      end, "Add to Harpoon")
      setKeymap("n", "<leader>ht", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, "Harpoon List")
      setKeymap("n", "<leader>h1", function()
        harpoon:list():select(1)
      end, "Add to Harpoon 1")
      setKeymap("n", "<leader>h2", function()
        harpoon:list():select(2)
      end, "Add to Harpoon 2")
      setKeymap("n", "<leader>h3", function()
        harpoon:list():select(3)
      end, "Add to Harpoon 3")
      setKeymap("n", "<leader>h4", function()
        harpoon:list():select(4)
      end, "Add to Harpoon 4")
      setKeymap("n", "<leader>hn", function()
        harpoon:list():prev()
      end, "Next Harpoon")
      setKeymap("n", "<leader>hn", function()
        harpoon:list():next()
      end, "Previous Harpoon")
    end,
  },
}
