return {
  "stevearc/conform.nvim",
  opts = {
    formatters = { "jq", "yq", "prettier", "prettierd", "biome-check" },
    formatters_by_ft = {
      javascript = { "biome-check", "prettier", "prettierd" },
      typescript = { "biome-check", "prettier", "prettierd" },
      json = { "jq" },
      yaml = { "yq" },
    },
  },
}
