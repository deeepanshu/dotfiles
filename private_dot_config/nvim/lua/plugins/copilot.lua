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
      {
        "<leader>gt",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat",
      },
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
    },
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    config = function()
      local chat = require("CopilotChat")
      chat.setup({
        model = "claude-3.7-sonnet",
        temperature = 0,
        window = {
          layout = "vertical",
          width = 0.2,
          height = 1,
        },
      })
    end,
  },
}
