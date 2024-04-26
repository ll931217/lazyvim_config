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

-- Navigator
vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")

-- Telescope
map("n", "<leader>fw", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", { desc = "Live grep" })
map("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({
    additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--no-ignore" })
    end,
  })
end, { desc = "Live grep in all files" })

-- GitHub Copilot
map(
  "i",
  "<C-e>",
  'copilot#Accept("\\<CR>")',
  { desc = "Accept Copilot suggestion", expr = true, replace_keycodes = false }
)
vim.g.copilot_no_tab_map = true

-- GitHub Copilot Chat
map("n", "<leader>ac", "", { desc = "Copilot Chat" })
map("n", "<leader>act", "<cmd>lua require'CopilotChat'.toggle()<cr>", { desc = "Toggle Chat" })
map("n", "<leader>acq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "Quick Chat" })
