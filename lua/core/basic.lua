vim.keymap.set("n", "<leader>vs", ":vs<cr><C-W>l")
vim.keymap.set("n", "<leader>sp", ":sp<cr><C-W>j")
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro nu rnu"
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd([[autocmd FileType c,cpp,go setlocal shiftwidth=4 softtabstop=4 expandtab]])
-- vim.g.gruvbox_colors = { border = "orange" }
