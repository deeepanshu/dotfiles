return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local todo_comments = require("todo-comments")

      setKeymap("n", "]t", function()
        todo_comments.jump_next()
      end, "Next todo comment")

      setKeymap("n", "[t", function()
        todo_comments.jump_prev()
      end, "Prev todo comment")

      todo_comments.setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        reactjavascript = { "eslint_d" },
        reacttypescript = { "eslint_d" },
        python = { "ruff" },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
      setKeymap("n", "<leader>cl", function()
        lint.try_lint()
      end, "Trigger linting for current file")
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          reactjavascript = { "prettierd", "prettier", stop_after_first = true },
          reacttypescript = { "prettierd", "prettier", stop_after_first = true },
          python = { "ruff_fix", "ruff_format", "ruff_organise_imports", stop_after_first = true },
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
        },
        format_after_save = {
          async = true,
          stop_after_first = true,
        },
      })
      setKeymap({ "n", "v" }, "<leader>cf", function()
        conform.format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 1000,
        })
      end, "Format file or range")
    end,
  },
}
