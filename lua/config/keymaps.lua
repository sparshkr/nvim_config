-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Leader>vv", function()
  -- Close all other splits
  vim.cmd("only")

  -- Open input file in vertical split
  vim.cmd("vsplit inputf.in")

  -- Move to input window and split for output
  vim.cmd("wincmd l") -- Move to inputf.in
  vim.cmd("split outputf.in")

  -- Move focus back to code window
  vim.cmd("wincmd h")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-A>", "ggVG", { noremap = true, silent = true })

vim.keymap.set("n", "<A-Down>", "yyp", { noremap = true, silent = true })
