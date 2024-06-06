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
}
