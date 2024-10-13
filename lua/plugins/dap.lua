return {
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    opt = true,
    module = "dap",
    dependencies = {
      -- "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      -- "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      -- { "leoluz/nvim-dap-go", module = "dap-go" },
      -- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      { "mxsdev/nvim-dap-vscode-js" },
      {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm ci --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
    config = function()
      local dap, dapui, dapvscodejs = require("dap"), require("dapui"), require("dap-vscode-js")

      dapvscodejs.setup({
        -- node_path = "/home/ll931217/.local/share/pnpm/node",
        node_path = "/usr/bin/node",
        debugger_path = "/home/ll931217/.local/share/nvim/lazy/vscode-js-debug",
        -- debugger_cmd = { "js-debug-adapter" },
        adapters = { "pwa-node", "pwa-chrome" },
        log_file_path = "/tmp/vscode-js-debug.log",
        log_file_level = vim.log.levels.DEBUG,
        log_console_level = vim.log.levels.ERROR,
      })

      -- Doesn't work
      -- dap.adapters["pwa-node"] = {
      --   type = "server",
      --   host = "localhost",
      --   port = "${port}",
      --   executable = {
      --     command = "node",
      --     -- 💀 Make sure to update this path to point to your installation
      --     args = { "/home/ll931217/.local/share/nvim/lazy/vscode-js-debug/out/src/vsDebugServer.js", "${port}" },
      --   },
      -- }

      dap.configurations = require("config.dap")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.after.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.after.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
    end,
    disable = vim.fn.has("win32") == 1,
  },
}
