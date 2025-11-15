return {
  "stevearc/conform.nvim",
  opts = {
    formatters = { "jq", "yq", "biome-check" },
    formatters_by_ft = {
      javascript = { "biome-check" },
      typescript = { "biome-check" },
      json = { "jq" },
      yaml = { "yq" },
    },
  },
}
