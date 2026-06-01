-- SchemaStore Catalog: /mnt/NAS_Data/liangshih.lin/schemas/SchemaStore-catalog.json
local basepath = "file:///mnt/NAS_Data/liangshih.lin/schemastore/src/schemas/json/"
local extrapath = "file:///mnt/NAS_Data/liangshih.lin/schemas/"

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.jsonls = vim.tbl_deep_extend("force", opts.servers.jsonls or {}, {
        settings = {
          json = {
            schemaStore = {
              -- Disable built-in schemaStore (uses wrong www.schemastore.org URL)
              enable = false,
              url = "",
            },
            validate = { enable = true },
          },
        },
        -- Override LazyVim's before_init which appends the full unmodified catalog
        -- and silently undoes any `replace` we pass here.
        before_init = function(_, new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(
            new_config.settings.json.schemas,
            require("schemastore").json.schemas({
              replace = {
                ["package.json"] = basepath .. "package.json",
                ["Claude Code Settings"] = basepath .. "claude-code-settings.json",
                ["Claude Code Plugin Manifest"] = basepath .. "claude-code-plugin-manifest.json",
                ["Claude Code Plugin Marketplace"] = basepath .. "claude-code-plugin-marketplace.json",
              },
            })
          )
        end,
      })
      opts.servers.yamlls = vim.tbl_deep_extend("force", opts.servers.yamlls or {}, {
        settings = {
          yaml = {
            schemaStore = {
              -- Disable built-in schemaStore (uses wrong www.schemastore.org URL)
              enable = false,
              url = "",
            },
            validate = { enable = true },
          },
        },
        -- Override LazyVim's before_init which merges the full unmodified catalog
        -- and silently undoes any `replace` we pass here.
        before_init = function(_, new_config)
          new_config.settings.yaml.schemas = vim.tbl_deep_extend(
            "force",
            new_config.settings.yaml.schemas or {},
            require("schemastore").yaml.schemas({
              replace = {
                ["gitlab-ci"] = extrapath .. "gitlab-ci.json",
                ["App config Spotify Backstage"] = basepath .. "catalog-info.json",
              },
            })
          )
        end,
      })
    end,
  },
}
