return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                    always_show_bufferline = false,
                    close_command = function(n)
                        require("mini.bufremove").delete(n, false)
                    end,
                    right_mouse_command = function(n)
                        require("mini.bufremove").delete(n, false)
                    end,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    diagnostics = "nvim_lsp",
                    indicator = {
                        style = "underline",
                    },
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            padding = 1,
                            highlight = "Directory",
                            separator = true -- use a "true" to enable the default, or set your own character
                        }
                    }
                },
            })
            setKeymap("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", "Toggle pin")
            setKeymap("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers")
            setKeymap("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers")
            setKeymap("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right")
            setKeymap("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left")
            setKeymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", "Prev buffer")
            setKeymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", "Next buffer")
            vim.api.nvim_create_autocmd("BufAdd", {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
}
