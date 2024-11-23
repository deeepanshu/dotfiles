return {
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup()
  --
  --     vim.cmd("colorscheme github_light")
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require("kanagawa").setup({
  --       compile = false,
  --       undercurl = true,
  --       commentStyle = { italic = true },
  --       functionStyle = {},
  --       keywordStyle = { italic = true },
  --       statementStyle = { bold = true },
  --       typeStyle = {},
  --       transparent = false,
  --       dimInactive = false,
  --       terminalColors = true,
  --     })
  --     vim.cmd("colorscheme kanagawa-wave")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          cmp = true,
          gitsigns = true,
          illuminate = true,
          mason = true,
          markdown = true,
          native_lsp = {
            enabled = true,
          },
          telescope = true,
          treesitter = true,
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          which_key = true,
        },
      })
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
}
