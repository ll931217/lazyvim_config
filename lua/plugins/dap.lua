return {
  -- Debugging
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
  },
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
        run = "npm install --legacy-peer-deps && npm run compile",
      },
    },
    config = function()
      local dap, dapui, dapvscodejs = require("dap"), require("dapui"), require("dap-vscode-js")

      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
      }

      dapvscodejs.setup({
        node_path = "node",
        -- debugger_path = DEBUGGER_PATH,
        -- debugger_cmd = { "js-debug-adapter" },
        adapters = { "pwa-node", "pwa-chrome" },
      })

      -- dap.configurations = require 'user.configs.dap'

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
