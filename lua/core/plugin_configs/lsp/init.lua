require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
}

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
vim.cmd([[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab]])
