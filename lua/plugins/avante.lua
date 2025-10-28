return {
  "yetone/avante.nvim",
  enabled = true,
  event = "VeryLazy",
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- provider = "claude",
    -- provider = "copilot",
    -- provider = "openai",
    -- provider = "ollama",
    -- provider = "openrouter",
    provider = "vici",
    auto_suggestions_provider = "vici",
    -- system_prompt = function()
    --   local hub = require("mcphub").get_hub_instance()
    --   return hub:get_active_servers_prompt()
    -- end,
    -- -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
    -- custom_tools = function()
    --   return {
    --     require("mcphub.extensions.avante").mcp_tool(),
    --   }
    -- end,
    providers = {
      ["vici"] = {
        -- is_env_set = function () return true end,
        -- parse_api_key = function () return nil end,
        __inherited_from = "openai",
        endpoint = "http://aigw.vici.corp",
        model = "apac-sonnet-4",
        api_key_name = "ANTHROPIC_API_KEY",
        -- extra_request_body = {
        --   max_tokens = 4096,
        -- },
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
      -- ["vici"] = {
      --   __inherited_from = "azure",
      --   -- __inherited_from = "openai",
      --   endpoint = "https://vici-chat.openai.azure.com/openai/deployments/gpt-4-1",
      --   api_key_name = "OPENAI_API_KEY",
      --   model = "gpt-4-1",
      --   parse_curl_args = function (opts, code_opts)
      --     local headers = {
      --       ["Content-Type"] = "application/json",
      --       ["Accept"] = "application/json",
      --       ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
      --     }
      --
      --     return {
      --       url = opts.endpoint .. "/chat/completions?api-version=2025-01-01-preview",
      --       insecure = false,
      --       headers = headers,
      --       body = vim.tbl_deep_extend("force", {
      --         model = opts.model,
      --         maxTokensToSample = 4096,
      --         stream = true,
      --       }, {}),
      --     }
      --   end
      -- },
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "anthropic/claude-sonnet-4",
      },
      zai = {
        __inherited_from = "openai",
        endpoint = "https://api.z.ai/api/paas/v4/chat/completions",
        api_key_name = "ZAI_API_KEY",
        model = "glm-4.5",
      },
      zai_fast = {
        __inherited_from = "openai",
        endpoint = "https://api.z.ai/api/paas/v4/chat/completions",
        api_key_name = "ZAI_API_KEY",
        model = "glm-4.5-air",
      },
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "codegemma",
      },
    },
    behaviour = {
      use_cwd_as_project_root = true,
      auto_suggestions = false,
    },
    mappings = {
      suggestion = {
        accept = "<C-e>",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  -- {
  --   "ravitemer/mcphub.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  --   },
  --   cmd = "MCPHub", -- lazy load
  --   -- build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  --   -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  --   build = "bundled_build.lua", -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
  --   config = function()
  --     require("mcphub").setup({
  --       extensions = {
  --         avante = {
  --           make_slash_commands = true,
  --         },
  --       },
  --     })
  --   end,
  --   opts = {
  --     use_bundled_binary = true,
  --   },
  -- },
}
