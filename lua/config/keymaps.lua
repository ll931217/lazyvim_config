-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Enter command mode" })

map({ "n", "v" }, "<leader>]", "<cmd>Gen<cr>", { desc = "Gen with ollama" })

map("n", "<leader>o", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd.Neotree("focus")
  end
end, { desc = "Toggle NeoTree Focus" })

-- Toggle Floating Terminal
map({ "n", "t" }, "<A-i>", function()
  LazyVim.terminal(nil, { border = "rounded", size = { width = 0.8, height = 0.8 } })
end, { desc = "Toggle Floating Terminal" })

-- Tmux
map({ "n", "t" }, "<C-h>", "<cmd>lua require'tmux'.move_left()<cr>", { desc = "Move to left window" })
map({ "n", "t" }, "<C-j>", "<cmd>lua require'tmux'.move_bottom()<cr>", { desc = "Move to lower window" })
map({ "n", "t" }, "<C-k>", "<cmd>lua require'tmux'.move_up()<cr>", { desc = "Move to upper window" })
map({ "n", "t" }, "<C-l>", "<cmd>lua require'tmux'.move_right()<cr>", { desc = "Move to right window" })

-- GitHub Copilot
map(
  "n",
  "<C-e>",
  'copilot#Accept("\\<CR>")',
  { desc = "Accept Copilot suggestion", expr = true, replace_keycodes = false }
)
vim.g.copilot_no_tab_map = true

-- GitHub Copilot Chat
map("n", "<leader>act", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end)
