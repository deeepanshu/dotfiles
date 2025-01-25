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
            setKeymap("n", "<leader>ef", "<CMD> Neotree toggle show filesystem left <CR>", "Toggle Neotree")
            setKeymap("n", "<leader>eb", "<CMD> Neotree toggle show buffers left <CR>", "Toggle Neotree")
            setKeymap("n", "<leader>eg", "<CMD> Neotree toggle show git_status left <CR>", "Toggle Neotree")
        end
    }
}
