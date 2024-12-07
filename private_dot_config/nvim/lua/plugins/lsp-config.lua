return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "graphql" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "folke/lazydev.nvim",
        opts = {},
      },
      {
        "antosha417/nvim-lsp-file-operations",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" },
        config = function()
          require("lsp-file-operations").setup()
        end,
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local cpm_nvim_lsp = require("cmp_nvim_lsp")
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function()
          setKeymapOnBuf("n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
          setKeymapOnBuf("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          setKeymapOnBuf("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
          setKeymapOnBuf("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
          setKeymapOnBuf("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
          setKeymapOnBuf({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Show Code Actions")
          setKeymapOnBuf("n", "<leader>rn", vim.lsp.buf.rename, "Smart renamte")
          setKeymapOnBuf("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
          setKeymapOnBuf("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
          setKeymapOnBuf("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
          setKeymapOnBuf("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
          setKeymapOnBuf("n", "K", vim.lsp.buf.hover, "Show documentation for under cursor")
          setKeymapOnBuf("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
        end,
      })

      local capabilities = cpm_nvim_lsp.default_capabilities()
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
      })
    end,
  },
}
