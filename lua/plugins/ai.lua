return {
  {
    "David-Kunz/gen.nvim",
    lazy = false,
    opts = {
      model = "llama2",
      display_mode = "split",
    },
    config = function()
      require("gen").prompts["Fix_Code"] = {
        prompt = "Fix the following code. Output the code below the selected code.",
        replace = false,
      }
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {},
    config = function()
      require("avante").setup({
        provider = "claude",
        -- provider = "copilot",
        -- provider = "openai",
        -- provider = "ollama",
        vendors = {
          ---@type AvanteProvider
          ollama = {
            ["local"] = true,
            endpoint = "127.0.0.1:11434/v1",
            -- model = "deepseek-coder-v2",
            model = "qwen2.5",
            -- model = "ollama3.1",
            parse_curl_args = function(opts, code_opts)
              return {
                url = opts.endpoint .. "/chat/completions",
                headers = {
                  ["Accept"] = "application/json",
                  ["Content-Type"] = "application/json",
                },
                body = {
                  model = opts.model,
                  messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
                  max_tokens = 2048,
                  stream = true,
                },
              }
            end,
            parse_response_data = function(data_stream, event_state, opts)
              require("avante.providers").openai.parse_response(data_stream, event_state, opts)
            end,
          },
        },
        mappings = {
          ---@type AvanteConflictMappings
          suggestion = {
            accept = "<C-e>",
          },
        },
      })
    end,
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
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
  },
}
