return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
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
      vim.cmd("colorscheme catppuccin-macchiato")
      print("executed catppuccin setup")
    end,
  },
}
