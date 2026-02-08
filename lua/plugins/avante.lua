return {
  "yetone/avante.nvim",
  enabled = true,
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<CR>", mode = { "n", "v" }, desc = "Ask Avante" },
    { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with Avante" },
    { "<leader>ae", "<cmd>AvanteEdit<CR>", mode = { "n", "v" }, desc = "Edit Avante" },
    { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
    { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
    { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select Avante Model" },
    { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante Chat" },
    { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
    { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh Avante" },
    { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop Avante" },
    { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
  },
  opts = {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    ---@type Provider
    provider = "zai",
    auto_suggestions_provider = "zai_fast",
    default = {
      "avante_commands",
      "avante_mentions",
      "avante_shortcuts",
      "avante_files",
    },
    providers = {
      avante_commands = {
        name = "avante_commands",
        module = "blink.compat.source",
        score_offset = 90, -- show at a higher priority than lsp
        opts = {},
      },
      avante_files = {
        name = "avante_files",
        module = "blink.compat.source",
        score_offset = 100, -- show at a higher priority than lsp
        opts = {},
      },
      avante_mentions = {
        name = "avante_mentions",
        module = "blink.compat.source",
        score_offset = 1000, -- show at a higher priority than lsp
        opts = {},
      },
      avante_shortcuts = {
        name = "avante_shortcuts",
        module = "blink.compat.source",
        score_offset = 1000, -- show at a higher priority than lsp
        opts = {},
      },
      ["vici"] = {
        __inherited_from = "openai",
        endpoint = "http://aigw.vici.corp",
        model = "apac-sonnet-4",
        api_key_name = "ANTHROPIC_API_KEY",
        extra_request_body = {
          max_tokens = 200000,
        },
      },
      morph = {
        model = "morph-v3-large",
      },
      azure = {
        endpoint = "https://vici-chat.openai.azure.com/openai/deployments/gpt-4-1",
        api_key_name = "OPENAI_API_KEY",
        deployment = "gpt-4-1",
        api_version = "2025-01-01-preview",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_completion_tokens = 20480,
        },
      },
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "z-ai/glm-4.5-air:free",
      },
      zai = {
        __inherited_from = "openai",
        endpoint = "https://api.z.ai/api/coding/paas/v4",
        -- endpoint = "https://open.bigmodel.cn/api/coding/paas/v4",
        api_key_name = "GLM_API_KEY",
        model = "glm-4.7",
      },
      zai_fast = {
        __inherited_from = "openai",
        endpoint = "https://api.z.ai/api/coding/paas/v4",
        -- endpoint = "https://open.bigmodel.cn/api/coding/paas/v4",
        api_key_name = "GLM_API_KEY",
        model = "GLM-4.7-Flash",
      },
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "codegemma",
      },
    },
    selection = {
      enabled = true,
      hint_display = "immediate", -- "none" | "delayed" | "immediate"
    },
    selector = {
      --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      --- @type avante.SelectorProvider
      provider = "snacks",
      -- Options override for custom providers
      provider_opts = {
        title = "Avante Input",
        icon = " ",
      },
    },
    behaviour = {
      use_cwd_as_project_root = true,
      auto_suggestions = false,
      auto_set_keymaps = false,
      enable_fastapply = true,
    },
    mappings = {
      suggestion = {
        accept = "<C-e>",
      },
    },
  },
}
