return {
  {
    "yorickpeterse/nvim-pqf",
    config = function()
      require("pqf").setup({
        show_multiple_lines = false,
        max_filename_length = 50,
        filename_truncate_prefix = "[...]",
      })
    end,
  },
}
