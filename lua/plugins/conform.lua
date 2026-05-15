if true then
  return {}
end
return {
  "stevearc/conform.nvim",
  opts = {
    formatters = { "jq", "yq", "prettier", "prettierd", "biome" },
    formatters_by_ft = {
      javascript = { "biome", "prettier", "prettierd" },
      typescript = { "biome", "prettier", "prettierd" },
      json = { "jq" },
      yaml = { "yq" },
    },
  },
}
