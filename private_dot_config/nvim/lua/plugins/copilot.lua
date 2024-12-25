return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    very_lazy = true,
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = false,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    keys = {
      { "<leader>gt", function() require("CopilotChat").toggle() end, desc = "Toggle Copilot Chat" },
    },
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    config = function()
      local chat = require("CopilotChat")
      chat.setup({
        window = {
          width = 0.3,
        },
      })
    end,
  },
}
