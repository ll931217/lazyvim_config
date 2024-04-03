return {
  {
    "jackMort/ChatGPT.nvim",
    commit = "2107f7037c775bf0b9bff9015eed68929fcf493e",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    event = "VeryLazy",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
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
}
