return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
        config = function(_, opts)
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          setKeymap("n", "<leader>du", dapui.toggle(), "Toggle Debug UI")
          setKeymap({ "n", "v" }, "<leader>de", dapui.eval(), "Eval")
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
          "mfussenegger/nvim-dap",
          "williamboman/mason.nvim",
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = {},
        },
      },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- dap.configurations.scala = {
      --   {
      --     type = "scala",
      --     request = "launch",
      --     name = "RunOrTest",
      --     metals = {
      --       runType = "runOrTestFile",
      --       --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      --     },
      --   },
      --   {
      --     type = "scala",
      --     request = "launch",
      --     name = "Test Target",
      --     metals = {
      --       runType = "testTarget",
      --     },
      --   },
      -- }

      setKeymap("n", "<leader>dt", dap.toggle_breakpoint, "Toggle Breakpoint")
      setKeymap("n", "<leader>dc", dap.continue, "Continue Debugging")
    end,
  },
}
