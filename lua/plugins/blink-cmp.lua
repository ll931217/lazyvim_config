return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { "avante" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
        },
      },
    },
    -- compat = {
    --   "avante_commands",
    --   "avante_mentions",
    --   "avante_files",
    -- },
    snippets = { preset = "default" },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      -- confirm_key = "<CR>",
      -- disable_auto_lines = true,
    },
    keymap = {
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

      ["<CR>"] = { "select_and_accept", "fallback" },

      ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
    },
  },
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
  },
}
