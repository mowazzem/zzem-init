local dap = require("dap")
--dap.adapters.go = function(callback, config)
--  local handle
--  local pid_or_err
--  local port = 38697
--  handle, pid_or_err = vim.loop.spawn("dlv", {
--    args = { "dap", "-l", "127.0.0.1:" .. port },
--    detached = true,
--  }, function(code)
--    handle:close()
--    print("Delve exited with exit code: " .. code)
--  end)
--  ----should we wait for delve to start???
--  vim.defer_fn(function()
--    dap.repl.open()
--    callback({ type = "server", host = "127.0.0.1", port = port })
--  end, 100)
--  dap.repl.open()
--  callback({ type = "server", host = "127.0.0.1", port = port })
--end
---- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
--dap.configurations.go = {
--  {
--    type = "go",
--    name = "Debug",
--    request = "launch",
--    program = "${file}",
--  },
--}
--dap.adapters.dlv = {
--  type = "server",
--  host = "127.0.0.1",
--  port = 38697,
--}

dap.adapters.go = function(callback, config)
  -- Wait for delve to start
  vim.defer_fn(function()
    callback({ type = "server", host = "127.0.0.1", port = "38697" })
  end, 100)
end
dap.adapters.dlv = {
  type = "server",
  host = "127.0.0.1",
  port = 38697,
}
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    showLog = true,
    program = "${file}",
  },
  {
    type = "dlv",
    name = "Launch file via dlv instance running on 38697",
    request = "launch",
    showLog = true,
    program = "${workspaceFolder}",
  },
}


-- require("dap-go").setup({
--   -- dap_configurations = {
--   --   {
--   --     type = "go",
--   --     name = "Attach remote",
--   --     mode = "remote",
--   --     request = "attach",
--   --   },
--   -- },
-- })
