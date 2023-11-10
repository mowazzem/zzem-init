return {
  "fatih/vim-go",
  ft = { "go", "gomod", "gowork", "gotmpl" },
  config = function()
    vim.g.go_highlight_structs = 1
    vim.g.go_highlight_methods = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_function_calls = 1
    vim.g.go_highlight_operators = 1
    vim.g.go_highlight_types = 1
    vim.g.go_highlight_extra_types = 1
    vim.g.go_highlight_fields = 1
    vim.g.go_fmt_command = "gopls"
    vim.g.go_gopls_gofumpt = 1
  end,
}
