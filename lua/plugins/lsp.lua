return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.jsonls = vim.tbl_deep_extend("force", opts.servers.jsonls or {}, {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas({
              replace = {
                ["package.json"] = {
                  description = "Node's Package.json schema",
                  fileMatch = "package.json",
                  name = "package.json",
                  url = "file:///home/liangshih.lin/Documents/schemas/package.json",
                },
              },
              extra = {
                {
                  description = "Claude Code's settings",
                  fileMatch = "settings.json",
                  name = "settings.json",
                  url = "file:///home/liangshih.lin/Documents/schemas/claude-code-settings.json",
                },
              },
            }),
            validate = { enable = true },
          },
        },
      })
      opts.servers.yamlls = vim.tbl_deep_extend("force", opts.servers.yamlls or {}, {
        settings = {
          yaml = {
            schemaStore = {
              -- Disable built-in schemaStore (uses wrong www.schemastore.org URL)
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
    end,
  },
}
