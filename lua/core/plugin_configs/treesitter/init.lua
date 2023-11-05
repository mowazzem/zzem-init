require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "go", "typescript", "javascript", "zig", "json" },
  sync_install = false,
  auto_install = true,
}
