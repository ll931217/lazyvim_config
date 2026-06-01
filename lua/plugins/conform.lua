return {
  "stevearc/conform.nvim",
  opts = {
    formatters = { "jq", "yq", "prettier", "prettierd", "biome" },
    formatters_by_ft = {
      javascript = { "biome", "prettier", "prettierd" },
      typescript = { "biome", "prettier", "prettierd" },
      json = { "jq" },
      yaml = { "yq" },
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_fix", bufnr).available then
          return { "ruff_fix" }
        else
          return { "isort", "black" }
        end
      end,
    },
  },
}
