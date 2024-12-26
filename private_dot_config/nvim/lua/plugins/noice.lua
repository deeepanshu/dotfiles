return {
  {
    "echasnovski/mini.indentscope",
    version = false,
    opts = {
      symbol = "╎",
      options = {
        try_as_border = true,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
                { find = "%d+ lines yanked" },
                { find = "%d+ lines >ed" },
                { find = "%d+ lines <ed" },
                { find = "%d+ fewer lines" },
                { find = "%d+ more lines" },
              },
            },
            view = "mini",
          },
          {
            filter = {
              event = "metals",
            },
            view = "mini",
          },
          -- JTDLS is noisy, make it quiet
          {
            filter = {
              event = "lsp",
              any = {
                { find = "Validate documents" },
                { find = "Publish Diagnostics" },
              },
            },
            opts = {
              skip = true,
            },
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false, zindex = 100 })
      end,
    },
    init = function()
      -- Rely on noice to handle notifcations
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    opts = {
      input_buffer_type = "noice",
    },
  },
}
