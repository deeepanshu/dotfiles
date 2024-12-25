return {
  "norcalli/nvim-colorizer.lua",
  cmd = "ColorizerToggle",
  config = function()
    require("colorizer").setup({
      "hocon",
      "css",
      "javascript",
      html = {
        mode = "foreground",
      },
    })
  end,
}
