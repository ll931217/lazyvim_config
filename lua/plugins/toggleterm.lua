return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  cmd = "ToggleTerm",
  keys = {
    { "<leader>t", "", { desc = "ToggleTerm" } },
    { "<leader>tt", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", { silent = true, desc = "toggle terminal" } },
    {
      "<leader>th",
      "<cmd>ToggleTerm size=30 direction=horizontal<cr>",
      { silent = true, desc = "toggle terminal in horizontal split" },
    },
    {
      "<leader>tv",
      "<cmd>ToggleTerm size=80 direction=vertical<cr>",
      { silent = true, desc = "toggle terminal in vertical split" },
    },
  },
}
