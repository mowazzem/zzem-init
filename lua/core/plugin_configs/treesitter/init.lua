require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "go", "typescript", "javascript" },
  sync_install = false,
  auto_install = true,
}
