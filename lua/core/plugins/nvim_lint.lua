return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      json = { "eslint_d" },
      yaml = { "eslint_d" },
      proto = { "buf_lint" },
    }
    local lint_aug = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_aug,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
