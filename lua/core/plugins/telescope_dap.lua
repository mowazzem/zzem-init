return {
  "nvim-telescope/telescope-dap.nvim",
  keys = { "<leader>dcc", "<leader>dco" },
  config = function()
    require("core.plugin_configs.dap.telescope-dap")
  end,
}
