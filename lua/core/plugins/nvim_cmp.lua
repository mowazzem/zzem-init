return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    require("core.plugin_configs.cmp")
  end,
  dependencies = {
    { "quangnguyen30192/cmp-nvim-ultisnips" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
  },
}
