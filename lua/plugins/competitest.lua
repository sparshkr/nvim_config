return {
  "xeluxee/competitest.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy", -- Load the plugin during the VeryLazy event
  config = function()
    require("competitest").setup({
      runner_ui = {
        interface = "split", -- Opens UI in a split window
        position = "right", -- Options: "top", "bottom", or "left"
        total_width = 0.3, -- Adjusts the relative width of the split
      },
      testcases_use_single_file = true, -- Store all test cases in a single file
      testcases_single_file_format = "$(FNOEXT).testcases", -- Naming format for the single file
      -- Other configuration options...
    })
  end,
}
