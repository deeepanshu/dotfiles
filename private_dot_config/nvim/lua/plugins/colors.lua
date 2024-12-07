return {
  "norcalli/nvim-colorizer.lua",
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
