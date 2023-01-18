require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local lspconfig = require('lspconfig')
local opts = {}
require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    opts.on_attach = function(_, bufnr)
      local bufopts = { silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end
    lspconfig[server_name].setup(opts)
  end,
  ["sumneko_lua"] = function()
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    }
    lspconfig.sumneko_lua.setup(opts)
  end,
  ["tsserver"] = function()
    opts.filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
    opts.cmd = { "typescript-language-server", "--stdio" }
    lspconfig.tsserver.setup(opts)
  end,
}

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
vim.cmd([[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab]])
vim.cmd([[autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab]])
vim.cmd([[autocmd FileType javscript setlocal shiftwidth=2 softtabstop=2 expandtab]])
