return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "catppuccin",
      colorscheme = "eldritch",
      -- colorscheme = "dracula",
    },
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        term_colors = true,
        transparent_background = true,
      })
    end,
    opts = {
      term_colors = true,
      transparent_background = true,
    },
  },
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
