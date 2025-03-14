return {
    { 'kevinhwang91/promise-async' },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldcolumn = '0'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            setKeymap('n', 'zR', require('ufo').openAllFolds, "Open all folds")
            setKeymap('n', 'zM', require('ufo').closeAllFolds, "Close all folds")
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim"
        },
        config = function()
            -- run `:help lspconfig-all` to view all
            local ensure_installed = {
                "lua_ls",
                "ts_ls",
                "graphql",
                "pyright",
                "ruff",
                "eslint",
                "jsonls",
                "csharp_ls",
                "bashls",
            }
            require('mason-tool-installer').setup {
                ensure_installed = ensure_installed,
            }
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                "antosha417/nvim-lsp-file-operations",
                dependencies = { "nvim-lua/plenary.nvim" },
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
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }
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
                ["eslint"] = function()
                    lspconfig["eslint"].setup({
                        flags = {
                            allow_incremental_sync = false,
                            debounce_text_changes = 1000,
                        },
                    })
                end,
                ["pyright"] = function()
                    lspconfig["pyright"].setup {
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    autoImportCompletions = true,
                                    useLibraryCodeForTypes = true,
                                }
                            }
                        }
                    }
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
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'lsp', 'indent' }
                end
            })
        end,
    },
}
