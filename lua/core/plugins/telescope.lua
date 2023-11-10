return {
  "nvim-telescope/telescope.nvim",
  -- tag = "0.1.0",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  lazy = true,
  cmd = { "Telescope", "Telescope find_files", "Telescope live_grep", "Telescope buffers", "Telescope help_tags" },
  config = function()
    require("core.plugin_configs.telescope")
  end,
}
