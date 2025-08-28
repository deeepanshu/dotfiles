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
}
