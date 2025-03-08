-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c" },
  callback = function()
    vim.keymap.set("n", "<C-B>", function()
      local filename = vim.fn.expand("%:p")
      local basename = vim.fn.expand("%:r")

      -- Ensure input file exists
      local input_file = "inputf.in"
      if vim.fn.filereadable(input_file) == 0 then
        io.open(input_file, "w"):close()
      end

      -- Save the current file
      vim.cmd("w")

      -- Compile and capture errors
      local compile_cmd = string.format("g++ %s -o %s 2> compile_errors.log", filename, basename)
      vim.cmd("!" .. compile_cmd)

      -- Check if compilation succeeded
      if vim.fn.filereadable("compile_errors.log") == 1 and vim.fn.getfsize("compile_errors.log") > 0 then
        vim.cmd("botright split compile_errors.log | setlocal buftype=nofile") -- Show errors in a split
        return
      end

      -- Run the program if compilation succeeded
      local run_cmd = string.format("%s < %s > outputf.in", basename, input_file)
      vim.cmd("!" .. run_cmd)

      -- Ensure output file exists
      local output_file = "outputf.in"
      if vim.fn.filereadable(output_file) == 0 then
        io.open(output_file, "w"):close()
      end
    end, { buffer = true })
  end,
})
