return {
  "leoluz/nvim-dap-go",
  ft = { "go", "gomod", "gowork", "gotmpl" },
  config = function()
    require("core.plugin_configs.dap.go")
  end,
}
