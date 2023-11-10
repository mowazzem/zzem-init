return {
  "cshuaimin/ssr.nvim",
  -- init is always executed during startup, but doesn't load the plugin yet.
  init = function()
    vim.keymap.set({ "n", "x" }, "<leader>sr", function()
      -- this require will automatically load the plugin
      require("ssr").open()
    end, { desc = "Structural Replace" })
  end,
}
