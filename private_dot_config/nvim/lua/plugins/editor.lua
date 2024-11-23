return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        setKeymapOnBuf({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk", buffer)
        setKeymapOnBuf("n", "<leader>hd", function()
          gs.diffthis("~")
        end, "Diff File", buffer)
        setKeymapOnBuf("n", "]h", gs.next_hunk, "Next Hunk", buffer)
        setKeymapOnBuf("n", "[h", gs.prev_hunk, "Prev Hunk", buffer)
        setKeymapOnBuf("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame Line", buffer)
      end,
    },
  },
  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = {
      {
        "<leader>bc",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bC",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "blame" },
      { "<leader>gs", "<cmd>Git st<cr>", desc = "status" },
      { "<leader>gca", "<cmd>Git ca<cr>", desc = "commit -a" },
      { "<leader>gl", "<cmd>Git log<cr>", desc = "log" },
    },
  },
  -- Link to Gitlab
  {
    "linrongbin16/gitlinker.nvim",
    keys = {
      {
        "<leader>gy",
        "<cmd>GitLink<cr>",
        mode = { "n", "v" },
        desc = "Yank remote-url",
      },
    },
    config = function()
      require("gitlinker").setup({
        router = {
          browse = {
            ["^gitlab%.agodadev%.io"] = require("gitlinker.routers").gitlab_browse,
          },
          blame = {
            ["^gitlab%.agodadev%.io"] = require("gitlinker.routers").gitlab_blame,
          },
        },
      })
    end,
  },
}
