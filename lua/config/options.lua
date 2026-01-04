-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.lazyvim_debug_set_default = true

-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldmethod = "manual"
vim.opt.foldmethod = "syntax"

vim.cmd([[
  highlight Normal guibg=NONE
  highlight NonText guibg=NONE
  highlight Normal ctermbg=NONE
  highlight NonText ctermbg=NONE
]])

local function alpha()
  return math.floor(vim.g.transparency * 255)
end

vim.opt.listchars = {
  tab = "🡒 ",
  space = "·",
  nbsp = "␣",
  extends = "⟩",
  precedes = "⟨",
}

vim.opt.guicursor = "a:blinkon100"
vim.opt.hidden = true

-- Neovide configration
if vim.g.neovide then
  vim.o.termguicolors = true
  vim.opt.guifont = "Fantasque_Sans_Mono:h12"
  -- vim.opt.guifont = { 'FiraCode Nerd Font Mono,codicon Nerd Font', 'h18' }

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_cursor_vfx_mode = "wireframe"

  -- vim.g.neovide_theme = "auto"
  -- vim.g.background = "dark"

  -- Padding
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5

  vim.g.neovide_transparency = 0.8
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#24273A" .. alpha()

  -- Zoom controls
  -- vim.api.nvim_set_keymap(
  --   "n",
  --   "<C-+>",
  --   ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
  --   { silent = true }
  -- )
  -- vim.api.nvim_set_keymap(
  --   "n",
  --   "<C-->",
  --   ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
  --   { silent = true }
  -- )
  -- vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
