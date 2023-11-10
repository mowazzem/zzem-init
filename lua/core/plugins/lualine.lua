return {
  "nvim-lualine/lualine.nvim",
  event = "VimEnter",
  config = function()
    require("core.plugin_configs.lualine")
  end,
  requires = {
    {
      "kyazdani42/nvim-web-devicons",
    },
  },
}
