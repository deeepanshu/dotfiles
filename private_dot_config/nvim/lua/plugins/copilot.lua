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
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "openai",
      claude = {
        endpoint = "https://openai-proxy.agoda.is/v1",
        model = "claude-3-5-sonnet-20241022",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
      openai = {
        endpoint = "https://openai-proxy.agoda.is/v1",
        model = "gpt-4o",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
    },
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "main",
  --   keys = {
  --     {
  --       "<leader>gt",
  --       function()
  --         require("CopilotChat").toggle()
  --       end,
  --       desc = "Toggle Copilot Chat",
  --     },
  --     {
  --       "<leader>ccq",
  --       function()
  --         local input = vim.fn.input("Quick Chat: ")
  --         if input ~= "" then
  --           require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  --         end
  --       end,
  --       desc = "CopilotChat - Quick chat",
  --     },
  --   },
  --   dependencies = {
  --     "zbirenbaum/copilot.lua",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   build = "make tiktoken",
  --   config = function()
  --     local chat = require("CopilotChat")
  --     chat.setup({
  --       model = "claude-3.7-sonnet",
  --       temperature = 0,
  --       window = {
  --         layout = "vertical",
  --         width = 0.2,
  --         height = 1,
  --       },
  --     })
  --   end,
  -- },
}
