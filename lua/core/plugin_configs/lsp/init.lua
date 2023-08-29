require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls", "zls", "tsserver" },
})

local onattach = function(_, bufnr)
  local bufopts = { silent = true, buffer = bufnr }
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "go", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  on_attach = onattach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
lspconfig.gopls.setup({
  on_attach = onattach,
})
lspconfig.zls.setup({
  on_attach = onattach,
})
lspconfig.tsserver.setup({
  on_attach = onattach,
  filetypes = { "typescript", "typescriptreact", "javascript" },
  cmd = { "typescript-language-server", "--stdio" },
})
lspconfig.yamlls.setup({
  on_attach = onattach,
  filetypes = { "yaml", "yml" },
  cmd = { "yaml-language-server", "--stdio" },
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
})
lspconfig.dockerls.setup({
  on_attach = onattach,
  settings = {
    diagnostics = {
      virtual_text = true,
    },
  },
})
lspconfig.solargraph.setup({
  on_attach = onattach,
})

lspconfig.neocmake.setup({
  on_attach = onattach,
})

lspconfig.ols.setup({
  on_attach = onattach,
})
lspconfig.svelte.setup({
  on_attach = onattach,
})

-- lspconfig.bufls.setup({
--   on_attach = onattach,
--   filetypes = { "proto" },
--   cmd = { "bufls", "serve" },
--   rootpatterns = { "buf.yaml", ".git" },
-- })
