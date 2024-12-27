return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      {
        "sshelll/telescope-switch.nvim",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          layout_strategy = "vertical",
          file_ignore_patterns = { "node_modules", ".yarn", "__pycache__" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j"] = actions.move_selection_next,
              ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
              ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
          switch = {
            matchers = {
              {
                name = "Scala Spec",
                from = "src/main/scala/(.*).scala$",
                to = "src/test/scala/%1Spec.scala",
              },
              {
                name = "Scala Test",
                from = "src/main/scala/(.*).scala$",
                to = "src/test/scala/%1Test.scala",
              },
              {
                name = "Scala Impl",
                from = "src/test/scala/(.*)(Spec|Test).scala$",
                to = "src/main/scala/%1.scala",
              },
            },
            picker = {
              layout_strategy = "vertical",
              -- Disable plugin's layout sizing
              layout_config = false,
            },
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",
          },
        },
      })
      telescope.load_extension("live_grep_args")
      telescope.load_extension("fzf")
      telescope.load_extension("switch")
      setKeymap("n", "<leader>ff", builtin.find_files, "Find files")
      setKeymap("n", "<leader><leader>", builtin.find_files, "Find files")
      setKeymap("n", "<leader>:", "<cmd>Telescope command_history<CR>", "Commands")
      setKeymap("n", "<leader>gs", builtin.git_status, "Find files in Git")
      setKeymap("n", "<leader>gcb", builtin.git_branches, "Find Branches")
      setKeymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", "Recent")
      setKeymap("n", "<leader>fo", "<cmd>Telescope resume<CR>", "Recent Search")
      setKeymap("n", "<leader>ft", "<cmd>Telescope switch<cr>", "Switch to related files")
      setKeymap("n", "<leader>/", function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end, "Grep (root dir)")
      setKeymap("n", "<leader>fb", builtin.buffers, "Telescope buffers")
      setKeymap("n", "<leader>fh", builtin.help_tags, "Telescope help tags")
      setKeymap("n", "<leader>fc", "<cmd>Telescope commands<CR>", "Commands")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "RRethy/vim-illuminate",
    events = "VeryLazy",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp", "treesitter" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
