return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                buffers = {
                    follow_current_file = { enabled = true },
                },

                filesystem = {
                    follow_current_file = { enabled = true },
                },
            })
            setKeymap("n", "<leader>ef", "<CMD> Neotree toggle focus filesystem left <CR>", "Toggle Neotree")
            setKeymap("n", "<leader>eb", "<CMD> Neotree toggle focus buffers left <CR>", "Toggle Neotree")
            setKeymap("n", "<leader>eg", "<CMD> Neotree toggle focus git_status left <CR>", "Toggle Neotree")
        end
    }
}
